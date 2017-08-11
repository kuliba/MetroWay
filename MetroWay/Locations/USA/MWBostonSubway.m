//
//  MMBostonRapidTransitAndKeyBus.m
//  Metro Maps
//
//  Created by Valentin Ozerov on 12.10.14.
//  Copyright (c) 2014 Valentin Ozerov. All rights reserved.
//
//  History:
//  001. Initial version
//  002. [28.08.2015] Пофиксены мелкие баги

#import "MWBostonSubway.h"

@implementation MWBostonSubway

// Инициализируем
- (id)init
{
    self = [super init];
    
    self.identifier = @"boston_subway";

    ////////////////////////////////////////////////////////////////
    // Создаем линии
    ////////////////////////////////////////////////////////////////
    
    // 1. Red Line
    MWLine *line0001 = [[MWLine alloc] init];
    line0001.identifier = @"line0001";
    line0001.nameOriginal = @"Red Line";
    line0001.color = [UIColor colorWithRed:(225/255.0) green:(39/255.0) blue:(38/255.0) alpha:1];
    [self.lines addObject:line0001];

    // 2. Mattapan Line
    MWLine *line0002 = [[MWLine alloc] init];
    line0002.identifier = @"line0002";
    line0002.nameOriginal = @"Mattapan Line";
    line0002.color = [UIColor colorWithRed:(225/255.0) green:(39/255.0) blue:(38/255.0) alpha:1];
    [self.lines addObject:line0002];

    // 3. Orange Line
    MWLine *line0003 = [[MWLine alloc] init];
    line0003.identifier = @"line0003";
    line0003.nameOriginal = @"Orange Line";
    line0003.color = [UIColor colorWithRed:(241/255.0) green:(139/255.0) blue:(33/255.0) alpha:1];
    [self.lines addObject:line0003];

    // 4. Blue Line
    MWLine *line0004 = [[MWLine alloc] init];
    line0004.identifier = @"line0004";
    line0004.nameOriginal = @"Blue Line";
    line0004.color = [UIColor colorWithRed:(0/255.0) green:(124/255.0) blue:(195/255.0) alpha:1];
    [self.lines addObject:line0004];

    // 5. Silver Line SL1
    MWLine *line0005 = [[MWLine alloc] init];
    line0005.identifier = @"line0005";
    line0005.nameOriginal = @"Silver Line SL1";
    line0005.color = [UIColor colorWithRed:(125/255.0) green:(134/255.0) blue:(140/255.0) alpha:1];
    [self.lines addObject:line0005];

    // 6. Silver Line SL2
    MWLine *line0006 = [[MWLine alloc] init];
    line0006.identifier = @"line0006";
    line0006.nameOriginal = @"Silver Line SL2";
    line0006.color = [UIColor colorWithRed:(125/255.0) green:(134/255.0) blue:(140/255.0) alpha:1];
    [self.lines addObject:line0006];

    // 7. Silver Line SL4
    MWLine *line0007 = [[MWLine alloc] init];
    line0007.identifier = @"line0007";
    line0007.nameOriginal = @"Silver Line SL4";
    line0007.color = [UIColor colorWithRed:(125/255.0) green:(134/255.0) blue:(140/255.0) alpha:1];
    [self.lines addObject:line0007];

    // 8. Silver Line SL5
    MWLine *line0008 = [[MWLine alloc] init];
    line0008.identifier = @"line0008";
    line0008.nameOriginal = @"Silver Line SL5";
    line0008.color = [UIColor colorWithRed:(125/255.0) green:(134/255.0) blue:(140/255.0) alpha:1];
    [self.lines addObject:line0008];

    // 9. Green Line В
    MWLine *line0009 = [[MWLine alloc] init];
    line0009.identifier = @"line0009";
    line0009.nameOriginal = @"Green Line B";
    line0009.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(69/255.0) alpha:1];
    [self.lines addObject:line0009];
 
    // 10. Green Line С
    MWLine *line0010 = [[MWLine alloc] init];
    line0010.identifier = @"line0010";
    line0010.nameOriginal = @"Green Line С";
    line0010.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(69/255.0) alpha:1];
    [self.lines addObject:line0010];

    // 11. Green Line D
    MWLine *line0011 = [[MWLine alloc] init];
    line0011.identifier = @"line0011";
    line0011.nameOriginal = @"Green Line D";
    line0011.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(69/255.0) alpha:1];
    [self.lines addObject:line0011];

    // 12. Green Line E
    MWLine *line0012 = [[MWLine alloc] init];
    line0012.identifier = @"line0012";
    line0012.nameOriginal = @"Green Line E";
    line0012.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(69/255.0) alpha:1];
    [self.lines addObject:line0012];

    // Добавляем линии в массив для правильного порядка рисования
    [self.drawLinesOrder addObject:line0005];
    [self.drawLinesOrder addObject:line0007];
    [self.drawLinesOrder addObject:line0008];
    [self.drawLinesOrder addObject:line0003];
    [self.drawLinesOrder addObject:line0006];
    [self.drawLinesOrder addObject:line0001];
    [self.drawLinesOrder addObject:line0009];
    [self.drawLinesOrder addObject:line0010];
    [self.drawLinesOrder addObject:line0011];
    [self.drawLinesOrder addObject:line0012];
    [self.drawLinesOrder addObject:line0004];
    [self.drawLinesOrder addObject:line0002];

    ////////////////////////////////////////////////////////////////
    // Создаем вершины графа
    ////////////////////////////////////////////////////////////////
    
    // Alewife
    MWVertex *vertex0001 = [[MWVertex alloc] init];
    vertex0001.identifier = @"vertex0001";
    vertex0001.developmentName = @"Вершина: Alewife";
    [self.vertices addObject:vertex0001];

    // Park St
    MWVertex *vertex0002 = [[MWVertex alloc] init];
    vertex0002.identifier = @"vertex0002";
    vertex0002.developmentName = @"Вершина: Park St";
    [self.vertices addObject:vertex0002];

    MWDrawFillCircle *fillCircle0227 = [[MWDrawFillCircle alloc] init];
    fillCircle0227.center = CGPointMake(2065.5, 1275);
    fillCircle0227.radius = 16;
    fillCircle0227.fillColor = [UIColor blackColor];
    [vertex0002.drawPrimitives addObject:fillCircle0227];

    MWDrawFillCircle *fillCircle0228 = [[MWDrawFillCircle alloc] init];
    fillCircle0228.center = CGPointMake(2065.5, 1275);
    fillCircle0228.radius = 11;
    fillCircle0228.fillColor = [UIColor whiteColor];
    [vertex0002.drawPrimitives addObject:fillCircle0228];

    // Downtown Crossing
    MWVertex *vertex0003 = [[MWVertex alloc] init];
    vertex0003.identifier = @"vertex0003";
    vertex0003.developmentName = @"Вершина: Downtown Crossing";
    [self.vertices addObject:vertex0003];

    MWDrawFillCircle *fillCircle0229 = [[MWDrawFillCircle alloc] init];
    fillCircle0229.center = CGPointMake(2202.5, 1412);
    fillCircle0229.radius = 16;
    fillCircle0229.fillColor = [UIColor blackColor];
    [vertex0003.drawPrimitives addObject:fillCircle0229];
    
    MWDrawFillCircle *fillCircle0230 = [[MWDrawFillCircle alloc] init];
    fillCircle0230.center = CGPointMake(2202.5, 1412);
    fillCircle0230.radius = 11;
    fillCircle0230.fillColor = [UIColor whiteColor];
    [vertex0003.drawPrimitives addObject:fillCircle0230];

    // South Station
    MWVertex *vertex0004 = [[MWVertex alloc] init];
    vertex0004.identifier = @"vertex0004";
    vertex0004.developmentName = @"Вершина: South Station";
    [self.vertices addObject:vertex0004];

    MWDrawLine *drawLine0219 = [[MWDrawLine alloc] init];
    drawLine0219.startPoint = CGPointMake(2338, 1549);
    drawLine0219.endPoint = CGPointMake(2286, 1549);
    drawLine0219.width = 20;
    drawLine0219.color = [UIColor blackColor];
    [vertex0004.drawPrimitives addObject:drawLine0219];

    MWDrawFillCircle *fillCircle0231 = [[MWDrawFillCircle alloc] init];
    fillCircle0231.center = CGPointMake(2338, 1549);
    fillCircle0231.radius = 16;
    fillCircle0231.fillColor = [UIColor blackColor];
    [vertex0004.drawPrimitives addObject:fillCircle0231];
    
    MWDrawFillCircle *fillCircle0232 = [[MWDrawFillCircle alloc] init];
    fillCircle0232.center = CGPointMake(2338, 1549);
    fillCircle0232.radius = 11;
    fillCircle0232.fillColor = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:fillCircle0232];

    MWDrawFillCircle *fillCircle0233 = [[MWDrawFillCircle alloc] init];
    fillCircle0233.center = CGPointMake(2286, 1549);
    fillCircle0233.radius = 16;
    fillCircle0233.fillColor = [UIColor blackColor];
    [vertex0004.drawPrimitives addObject:fillCircle0233];
    
    MWDrawFillCircle *fillCircle0234 = [[MWDrawFillCircle alloc] init];
    fillCircle0234.center = CGPointMake(2286, 1549);
    fillCircle0234.radius = 11;
    fillCircle0234.fillColor = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:fillCircle0234];

    MWDrawLine *drawLine0220 = [[MWDrawLine alloc] init];
    drawLine0220.startPoint = CGPointMake(2338, 1549);
    drawLine0220.endPoint = CGPointMake(2286, 1549);
    drawLine0220.width = 10;
    drawLine0220.color = [UIColor whiteColor];
    [vertex0004.drawPrimitives addObject:drawLine0220];

    // JFK/UMass
    MWVertex *vertex0005 = [[MWVertex alloc] init];
    vertex0005.identifier = @"vertex0005";
    vertex0005.developmentName = @"Вершина: JFK/UMass";
    [self.vertices addObject:vertex0005];

    MWDrawFillCircle *fillCircle0235 = [[MWDrawFillCircle alloc] init];
    fillCircle0235.center = CGPointMake(2429.5, 2093);
    fillCircle0235.radius = 13;
    fillCircle0235.fillColor = [UIColor blackColor];
    [vertex0005.drawPrimitives addObject:fillCircle0235];
    
    MWDrawFillCircle *fillCircle0236 = [[MWDrawFillCircle alloc] init];
    fillCircle0236.center = CGPointMake(2429.5, 2093);
    fillCircle0236.radius = 10;
    fillCircle0236.fillColor = [UIColor whiteColor];
    [vertex0005.drawPrimitives addObject:fillCircle0236];

    // Braintree
    MWVertex *vertex0006 = [[MWVertex alloc] init];
    vertex0006.identifier = @"vertex0006";
    vertex0006.developmentName = @"Вершина: Braintree";
    [self.vertices addObject:vertex0006];

    MWDrawFillCircle *fillCircle0237 = [[MWDrawFillCircle alloc] init];
    fillCircle0237.center = CGPointMake(2895, 2892);
    fillCircle0237.radius = 13;
    fillCircle0237.fillColor = [UIColor blackColor];
    [vertex0006.drawPrimitives addObject:fillCircle0237];
    
    MWDrawFillCircle *fillCircle0238 = [[MWDrawFillCircle alloc] init];
    fillCircle0238.center = CGPointMake(2895, 2892);
    fillCircle0238.radius = 10;
    fillCircle0238.fillColor = [UIColor whiteColor];
    [vertex0006.drawPrimitives addObject:fillCircle0238];

    // Ashmont
    MWVertex *vertex0007 = [[MWVertex alloc] init];
    vertex0007.identifier = @"vertex0007";
    vertex0007.developmentName = @"Вершина: Ashmont";
    [self.vertices addObject:vertex0007];

    MWDrawLine *drawLine0221 = [[MWDrawLine alloc] init];
    drawLine0221.startPoint = CGPointMake(2301, 2599.5);
    drawLine0221.endPoint = CGPointMake(2301, 2636.5);
    drawLine0221.width = 19.5;
    drawLine0221.color = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:drawLine0221];

    MWDrawFillCircle *fillCircle0239 = [[MWDrawFillCircle alloc] init];
    fillCircle0239.center = CGPointMake(2301, 2599.5);
    fillCircle0239.radius = 16;
    fillCircle0239.fillColor = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:fillCircle0239];
    
    MWDrawFillCircle *fillCircle0240 = [[MWDrawFillCircle alloc] init];
    fillCircle0240.center = CGPointMake(2301, 2599.5);
    fillCircle0240.radius = 11;
    fillCircle0240.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0240];
    
    MWDrawFillCircle *fillCircle0241 = [[MWDrawFillCircle alloc] init];
    fillCircle0241.center = CGPointMake(2301, 2636.5);
    fillCircle0241.radius = 16;
    fillCircle0241.fillColor = [UIColor blackColor];
    [vertex0007.drawPrimitives addObject:fillCircle0241];
    
    MWDrawFillCircle *fillCircle0242 = [[MWDrawFillCircle alloc] init];
    fillCircle0242.center = CGPointMake(2301, 2636.5);
    fillCircle0242.radius = 11;
    fillCircle0242.fillColor = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:fillCircle0242];
    
    MWDrawLine *drawLine0222 = [[MWDrawLine alloc] init];
    drawLine0222.startPoint = CGPointMake(2301, 2599.5);
    drawLine0222.endPoint = CGPointMake(2301, 2636.5);
    drawLine0222.width = 9.5;
    drawLine0222.color = [UIColor whiteColor];
    [vertex0007.drawPrimitives addObject:drawLine0222];

    // Mattapan
    MWVertex *vertex0008 = [[MWVertex alloc] init];
    vertex0008.identifier = @"vertex0008";
    vertex0008.developmentName = @"Вершина: Mattapan";
    [self.vertices addObject:vertex0008];

    MWDrawFillCircle *fillCircle0243 = [[MWDrawFillCircle alloc] init];
    fillCircle0243.center = CGPointMake(1915, 2768.5);
    fillCircle0243.radius = 13;
    fillCircle0243.fillColor = [UIColor blackColor];
    [vertex0008.drawPrimitives addObject:fillCircle0243];
    
    MWDrawFillCircle *fillCircle0244 = [[MWDrawFillCircle alloc] init];
    fillCircle0244.center = CGPointMake(1915, 2768.5);
    fillCircle0244.radius = 10;
    fillCircle0244.fillColor = [UIColor whiteColor];
    [vertex0008.drawPrimitives addObject:fillCircle0244];

    // Forest Hills
    MWVertex *vertex0009 = [[MWVertex alloc] init];
    vertex0009.identifier = @"vertex0009";
    vertex0009.developmentName = @"Вершина: Forest Hills";
    [self.vertices addObject:vertex0009];

    MWDrawFillCircle *fillCircle0246 = [[MWDrawFillCircle alloc] init];
    fillCircle0246.center = CGPointMake(1163, 2453.5);
    fillCircle0246.radius = 10;
    fillCircle0246.fillColor = [UIColor whiteColor];
    [vertex0009.drawPrimitives addObject:fillCircle0246];
    
    // Tufts Medical Center
    MWVertex *vertex0010 = [[MWVertex alloc] init];
    vertex0010.identifier = @"vertex0010";
    vertex0010.developmentName = @"Вершина: Tufts Medical Center";
    [self.vertices addObject:vertex0010];

    MWDrawFillCircle *fillCircle0247 = [[MWDrawFillCircle alloc] init];
    fillCircle0247.center = CGPointMake(1915, 1701);
    fillCircle0247.radius = 16;
    fillCircle0247.fillColor = [UIColor blackColor];
    [vertex0010.drawPrimitives addObject:fillCircle0247];
    
    MWDrawFillCircle *fillCircle0248 = [[MWDrawFillCircle alloc] init];
    fillCircle0248.center = CGPointMake(1915, 1701);
    fillCircle0248.radius = 11;
    fillCircle0248.fillColor = [UIColor whiteColor];
    [vertex0010.drawPrimitives addObject:fillCircle0248];

    // Chinatown
    MWVertex *vertex0011 = [[MWVertex alloc] init];
    vertex0011.identifier = @"vertex0011";
    vertex0011.developmentName = @"Вершина: Chinatown";
    [self.vertices addObject:vertex0011];
    
    MWDrawFillCircle *fillCircle0249 = [[MWDrawFillCircle alloc] init];
    fillCircle0249.center = CGPointMake(2066.5, 1549);
    fillCircle0249.radius = 16;
    fillCircle0249.fillColor = [UIColor blackColor];
    [vertex0011.drawPrimitives addObject:fillCircle0249];
    
    MWDrawFillCircle *fillCircle0250 = [[MWDrawFillCircle alloc] init];
    fillCircle0250.center = CGPointMake(2066.5, 1549);
    fillCircle0250.radius = 11;
    fillCircle0250.fillColor = [UIColor whiteColor];
    [vertex0011.drawPrimitives addObject:fillCircle0250];

    // State
    MWVertex *vertex0012 = [[MWVertex alloc] init];
    vertex0012.identifier = @"vertex0012";
    vertex0012.developmentName = @"Вершина: State";
    [self.vertices addObject:vertex0012];
    
    MWDrawFillCircle *fillCircle0251 = [[MWDrawFillCircle alloc] init];
    fillCircle0251.center = CGPointMake(2270, 1258);
    fillCircle0251.radius = 16;
    fillCircle0251.fillColor = [UIColor blackColor];
    [vertex0012.drawPrimitives addObject:fillCircle0251];
    
    MWDrawFillCircle *fillCircle0252 = [[MWDrawFillCircle alloc] init];
    fillCircle0252.center = CGPointMake(2270, 1258);
    fillCircle0252.radius = 11;
    fillCircle0252.fillColor = [UIColor whiteColor];
    [vertex0012.drawPrimitives addObject:fillCircle0252];

    // Haymarket
    MWVertex *vertex0013 = [[MWVertex alloc] init];
    vertex0013.identifier = @"vertex0013";
    vertex0013.developmentName = @"Вершина: Haymarket";
    [self.vertices addObject:vertex0013];

    MWDrawFillCircle *fillCircle0253 = [[MWDrawFillCircle alloc] init];
    fillCircle0253.center = CGPointMake(2269.5, 1071);
    fillCircle0253.radius = 16;
    fillCircle0253.fillColor = [UIColor blackColor];
    [vertex0013.drawPrimitives addObject:fillCircle0253];

    MWDrawFillCircle *fillCircle0254 = [[MWDrawFillCircle alloc] init];
    fillCircle0254.center = CGPointMake(2269.5, 1071);
    fillCircle0254.radius = 11;
    fillCircle0254.fillColor = [UIColor whiteColor];
    [vertex0013.drawPrimitives addObject:fillCircle0254];

    // North Station
    MWVertex *vertex0014 = [[MWVertex alloc] init];
    vertex0014.identifier = @"vertex0014";
    vertex0014.developmentName = @"Вершина: North Station";
    [self.vertices addObject:vertex0014];

    MWDrawFillCircle *fillCircle0255 = [[MWDrawFillCircle alloc] init];
    fillCircle0255.center = CGPointMake(2269.5, 906.5);
    fillCircle0255.radius = 16;
    fillCircle0255.fillColor = [UIColor blackColor];
    [vertex0014.drawPrimitives addObject:fillCircle0255];

    MWDrawFillCircle *fillCircle0256 = [[MWDrawFillCircle alloc] init];
    fillCircle0256.center = CGPointMake(2269.5, 906.5);
    fillCircle0256.radius = 11;
    fillCircle0256.fillColor = [UIColor whiteColor];
    [vertex0014.drawPrimitives addObject:fillCircle0256];

    // Oak Grove
    MWVertex *vertex0015 = [[MWVertex alloc] init];
    vertex0015.identifier = @"vertex0015";
    vertex0015.developmentName = @"Вершина: Oak Grove";
    [self.vertices addObject:vertex0015];

    // Bowdoin
    MWVertex *vertex0016 = [[MWVertex alloc] init];
    vertex0016.identifier = @"vertex0016";
    vertex0016.developmentName = @"Вершина: Bowdoin";
    [self.vertices addObject:vertex0016];

    // Government Center
    MWVertex *vertex0017 = [[MWVertex alloc] init];
    vertex0017.identifier = @"vertex0017";
    vertex0017.developmentName = @"Вершина: Government Center";
    [self.vertices addObject:vertex0017];

    MWDrawFillCircle *fillCircle0257 = [[MWDrawFillCircle alloc] init];
    fillCircle0257.center = CGPointMake(2145, 1150.5);
    fillCircle0257.radius = 6;
    fillCircle0257.fillColor = [UIColor whiteColor];
    [vertex0017.drawPrimitives addObject:fillCircle0257];

    MWDrawFillCircle *fillCircle0258 = [[MWDrawFillCircle alloc] init];
    fillCircle0258.center = CGPointMake(2189.5, 1195);
    fillCircle0258.radius = 6;
    fillCircle0258.fillColor = [UIColor whiteColor];
    [vertex0017.drawPrimitives addObject:fillCircle0258];

    MWDrawFillCircle *fillCircle0259 = [[MWDrawFillCircle alloc] init];
    fillCircle0259.center = CGPointMake(2145, 1150.5);
    fillCircle0259.radius = 3.5;
    fillCircle0259.fillColor = [UIColor blackColor];
    [vertex0017.drawPrimitives addObject:fillCircle0259];

    MWDrawFillCircle *fillCircle0260 = [[MWDrawFillCircle alloc] init];
    fillCircle0260.center = CGPointMake(2189.5, 1195);
    fillCircle0260.radius = 3.5;
    fillCircle0260.fillColor = [UIColor blackColor];
    [vertex0017.drawPrimitives addObject:fillCircle0260];

    MWDrawLine *drawLine0223 = [[MWDrawLine alloc] init];
    drawLine0223.startPoint = CGPointMake(2145, 1150.5);
    drawLine0223.endPoint = CGPointMake(2189.5, 1195);
    drawLine0223.width = 12;
    drawLine0223.color = [UIColor whiteColor];
    [vertex0017.drawPrimitives addObject:drawLine0223];

    MWDrawLine *drawLine0225 = [[MWDrawLine alloc] init];
    drawLine0225.startPoint = CGPointMake(2145, 1195);
    drawLine0225.endPoint = CGPointMake(2189.5, 1150.5);
    drawLine0225.width = 12;
    drawLine0225.color = [UIColor whiteColor];
    [vertex0017.drawPrimitives addObject:drawLine0225];

    MWDrawLine *drawLine0224 = [[MWDrawLine alloc] init];
    drawLine0224.startPoint = CGPointMake(2145, 1150.5);
    drawLine0224.endPoint = CGPointMake(2189.5, 1195);
    drawLine0224.width = 7;
    drawLine0224.color = [UIColor blackColor];
    [vertex0017.drawPrimitives addObject:drawLine0224];

    MWDrawFillCircle *fillCircle0261 = [[MWDrawFillCircle alloc] init];
    fillCircle0261.center = CGPointMake(2145, 1195);
    fillCircle0261.radius = 6;
    fillCircle0261.fillColor = [UIColor whiteColor];
    [vertex0017.drawPrimitives addObject:fillCircle0261];

    MWDrawFillCircle *fillCircle0262 = [[MWDrawFillCircle alloc] init];
    fillCircle0262.center = CGPointMake(2189.5, 1150.5);
    fillCircle0262.radius = 6;
    fillCircle0262.fillColor = [UIColor whiteColor];
    [vertex0017.drawPrimitives addObject:fillCircle0262];

    MWDrawFillCircle *fillCircle0263 = [[MWDrawFillCircle alloc] init];
    fillCircle0263.center = CGPointMake(2145, 1195);
    fillCircle0263.radius = 3.5;
    fillCircle0263.fillColor = [UIColor blackColor];
    [vertex0017.drawPrimitives addObject:fillCircle0263];
    
    MWDrawFillCircle *fillCircle0264 = [[MWDrawFillCircle alloc] init];
    fillCircle0264.center = CGPointMake(2189.5, 1150.5);
    fillCircle0264.radius = 3.5;
    fillCircle0264.fillColor = [UIColor blackColor];
    [vertex0017.drawPrimitives addObject:fillCircle0264];

    MWDrawLine *drawLine0226 = [[MWDrawLine alloc] init];
    drawLine0226.startPoint = CGPointMake(2145, 1195);
    drawLine0226.endPoint = CGPointMake(2189.5, 1150.5);
    drawLine0226.width = 7;
    drawLine0226.color = [UIColor blackColor];
    [vertex0017.drawPrimitives addObject:drawLine0226];

    // Wonderland
    MWVertex *vertex0018 = [[MWVertex alloc] init];
    vertex0018.identifier = @"vertex0018";
    vertex0018.developmentName = @"Вершина: Wonderland";
    [self.vertices addObject:vertex0018];

    MWDrawFillCircle *fillCircle0265 = [[MWDrawFillCircle alloc] init];
    fillCircle0265.center = CGPointMake(3175.5, 370);
    fillCircle0265.radius = 13;
    fillCircle0265.fillColor = [UIColor blackColor];
    [vertex0018.drawPrimitives addObject:fillCircle0265];
    
    MWDrawFillCircle *fillCircle0266 = [[MWDrawFillCircle alloc] init];
    fillCircle0266.center = CGPointMake(3175.5, 370);
    fillCircle0266.radius = 10;
    fillCircle0266.fillColor = [UIColor whiteColor];
    [vertex0018.drawPrimitives addObject:fillCircle0266];

    // Terminal A
    MWVertex *vertex0019 = [[MWVertex alloc] init];
    vertex0019.identifier = @"vertex0019";
    vertex0019.developmentName = @"Вершина: Terminal A";
    [self.vertices addObject:vertex0019];

    // Silver Line Way
    MWVertex *vertex0020 = [[MWVertex alloc] init];
    vertex0020.identifier = @"vertex0020";
    vertex0020.developmentName = @"Вершина: Silver Line Way";
    [self.vertices addObject:vertex0020];

    // Tide St
    MWVertex *vertex0021 = [[MWVertex alloc] init];
    vertex0021.identifier = @"vertex0021";
    vertex0021.developmentName = @"Вершина: Tide St";
    [self.vertices addObject:vertex0021];

    // Black Falcon Ave
    MWVertex *vertex0022 = [[MWVertex alloc] init];
    vertex0022.identifier = @"vertex0022";
    vertex0022.developmentName = @"Вершина: Black Falcon Ave";
    [self.vertices addObject:vertex0022];

    // World Trade Ctr
    MWVertex *vertex0023 = [[MWVertex alloc] init];
    vertex0023.identifier = @"vertex0023";
    vertex0023.developmentName = @"Вершина: World Trade Ctr";
    [self.vertices addObject:vertex0023];
    
    // Courthouse
    MWVertex *vertex0024 = [[MWVertex alloc] init];
    vertex0024.identifier = @"vertex0024";
    vertex0024.developmentName = @"Вершина: Courthouse";
    [self.vertices addObject:vertex0024];

    // Boylston
    MWVertex *vertex0025 = [[MWVertex alloc] init];
    vertex0025.identifier = @"vertex0025";
    vertex0025.developmentName = @"Вершина: Boylston";
    [self.vertices addObject:vertex0025];

    MWDrawLine *drawLine0227 = [[MWDrawLine alloc] init];
    drawLine0227.startPoint = CGPointMake(1915, 1411.5);
    drawLine0227.endPoint = CGPointMake(1974.5, 1411.5);
    drawLine0227.width = 20;
    drawLine0227.color = [UIColor blackColor];
    [vertex0025.drawPrimitives addObject:drawLine0227];
    
    MWDrawFillCircle *fillCircle0267 = [[MWDrawFillCircle alloc] init];
    fillCircle0267.center = CGPointMake(1915, 1411.5);
    fillCircle0267.radius = 16;
    fillCircle0267.fillColor = [UIColor blackColor];
    [vertex0025.drawPrimitives addObject:fillCircle0267];
    
    MWDrawFillCircle *fillCircle0268 = [[MWDrawFillCircle alloc] init];
    fillCircle0268.center = CGPointMake(1915, 1411.5);
    fillCircle0268.radius = 11;
    fillCircle0268.fillColor = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:fillCircle0268];
    
    MWDrawFillCircle *fillCircle0269 = [[MWDrawFillCircle alloc] init];
    fillCircle0269.center = CGPointMake(1974.5, 1411.5);
    fillCircle0269.radius = 16;
    fillCircle0269.fillColor = [UIColor blackColor];
    [vertex0025.drawPrimitives addObject:fillCircle0269];
    
    MWDrawFillCircle *fillCircle0270 = [[MWDrawFillCircle alloc] init];
    fillCircle0270.center = CGPointMake(1974.5, 1411.5);
    fillCircle0270.radius = 11;
    fillCircle0270.fillColor = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:fillCircle0270];
    
    MWDrawLine *drawLine0271 = [[MWDrawLine alloc] init];
    drawLine0271.startPoint = CGPointMake(1915, 1411.5);
    drawLine0271.endPoint = CGPointMake(1974.5, 1411.5);
    drawLine0271.width = 10;
    drawLine0271.color = [UIColor whiteColor];
    [vertex0025.drawPrimitives addObject:drawLine0271];
    
    // Herald St
    MWVertex *vertex0026 = [[MWVertex alloc] init];
    vertex0026.identifier = @"vertex0026";
    vertex0026.developmentName = @"Вершина: Herald St";
    [self.vertices addObject:vertex0026];

    // East Berkeley St
    MWVertex *vertex0027 = [[MWVertex alloc] init];
    vertex0027.identifier = @"vertex0027";
    vertex0027.developmentName = @"Вершина: East Berkeley St";
    [self.vertices addObject:vertex0027];

    // Union Park St
    MWVertex *vertex0028 = [[MWVertex alloc] init];
    vertex0028.identifier = @"vertex0028";
    vertex0028.developmentName = @"Вершина: Union Park St";
    [self.vertices addObject:vertex0028];

    // Newton St
    MWVertex *vertex0029 = [[MWVertex alloc] init];
    vertex0029.identifier = @"vertex0029";
    vertex0029.developmentName = @"Вершина: Newton St";
    [self.vertices addObject:vertex0029];

    // Worcester Sq
    MWVertex *vertex0030 = [[MWVertex alloc] init];
    vertex0030.identifier = @"vertex0030";
    vertex0030.developmentName = @"Вершина: Worcester Sq";
    [self.vertices addObject:vertex0030];

    // Mass. Ave
    MWVertex *vertex0031 = [[MWVertex alloc] init];
    vertex0031.identifier = @"vertex0031";
    vertex0031.developmentName = @"Вершина: Mass. Ave";
    [self.vertices addObject:vertex0031];

    // Lenox St
    MWVertex *vertex0032 = [[MWVertex alloc] init];
    vertex0032.identifier = @"vertex0032";
    vertex0032.developmentName = @"Вершина: Lenox St";
    [self.vertices addObject:vertex0032];

    // Melnea Cass
    MWVertex *vertex0033 = [[MWVertex alloc] init];
    vertex0033.identifier = @"vertex0033";
    vertex0033.developmentName = @"Вершина: Melnea Cass";
    [self.vertices addObject:vertex0033];

    // Dudley Sq
    MWVertex *vertex0034 = [[MWVertex alloc] init];
    vertex0034.identifier = @"vertex0034";
    vertex0034.developmentName = @"Вершина: Dudley Sq";
    [self.vertices addObject:vertex0034];

    MWDrawFillCircle *fillCircle0271 = [[MWDrawFillCircle alloc] init];
    fillCircle0271.center = CGPointMake(1915, 2199);
    fillCircle0271.radius = 13;
    fillCircle0271.fillColor = [UIColor blackColor];
    [vertex0034.drawPrimitives addObject:fillCircle0271];
    
    MWDrawFillCircle *fillCircle0272 = [[MWDrawFillCircle alloc] init];
    fillCircle0272.center = CGPointMake(1915, 2199);
    fillCircle0272.radius = 10;
    fillCircle0272.fillColor = [UIColor whiteColor];
    [vertex0034.drawPrimitives addObject:fillCircle0272];

    // Lechmere
    MWVertex *vertex0035 = [[MWVertex alloc] init];
    vertex0035.identifier = @"vertex0035";
    vertex0035.developmentName = @"Вершина: Lechmere";
    [self.vertices addObject:vertex0035];

    // Arlington
    MWVertex *vertex0036 = [[MWVertex alloc] init];
    vertex0036.identifier = @"vertex0036";
    vertex0036.developmentName = @"Вершина: Arlington";
    [self.vertices addObject:vertex0036];

    // Copley
    MWVertex *vertex0037 = [[MWVertex alloc] init];
    vertex0037.identifier = @"vertex0037";
    vertex0037.developmentName = @"Вершина: Copley";
    [self.vertices addObject:vertex0037];

    // Heath
    MWVertex *vertex0038 = [[MWVertex alloc] init];
    vertex0038.identifier = @"vertex0038";
    vertex0038.developmentName = @"Вершина: Heath";
    [self.vertices addObject:vertex0038];

    MWDrawFillCircle *fillCircle0273 = [[MWDrawFillCircle alloc] init];
    fillCircle0273.center = CGPointMake(1172, 2051);
    fillCircle0273.radius = 13;
    fillCircle0273.fillColor = [UIColor blackColor];
    [vertex0038.drawPrimitives addObject:fillCircle0273];
    
    MWDrawFillCircle *fillCircle0274 = [[MWDrawFillCircle alloc] init];
    fillCircle0274.center = CGPointMake(1172, 2051);
    fillCircle0274.radius = 10;
    fillCircle0274.fillColor = [UIColor whiteColor];
    [vertex0038.drawPrimitives addObject:fillCircle0274];

    // Hynes Convention Ctr
    MWVertex *vertex0039 = [[MWVertex alloc] init];
    vertex0039.identifier = @"vertex0039";
    vertex0039.developmentName = @"Вершина: Hynes Convention Ctr";
    [self.vertices addObject:vertex0039];

    // Kenmore
    MWVertex *vertex0040 = [[MWVertex alloc] init];
    vertex0040.identifier = @"vertex0040";
    vertex0040.developmentName = @"Вершина: Kenmore";
    [self.vertices addObject:vertex0040];

    // Boston College
    MWVertex *vertex0041 = [[MWVertex alloc] init];
    vertex0041.identifier = @"vertex0041";
    vertex0041.developmentName = @"Вершина: Boston College";
    [self.vertices addObject:vertex0041];

    // Cleveland Circle
    MWVertex *vertex0042 = [[MWVertex alloc] init];
    vertex0042.identifier = @"vertex0042";
    vertex0042.developmentName = @"Вершина: Cleveland Circle";
    [self.vertices addObject:vertex0042];

    // Riverside
    MWVertex *vertex0043 = [[MWVertex alloc] init];
    vertex0043.identifier = @"vertex0043";
    vertex0043.developmentName = @"Вершина: Riverside";
    [self.vertices addObject:vertex0043];

    ////////////////////////////////////////////////////////////////
    // 1. Red Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Alewife - Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0001 = [[MWEdge alloc] init];
    edge0001.identifier = @"edge0001";
    edge0001.developmentName = @"Ребро: Alewife - Park St";
    [self.edges addObject:edge0001];
    
    // Добавляем линию
    edge0001.line = line0001;
    
    // Добавляем вершину
    edge0001.startVertex = vertex0001;
    
    // Добавляем станцию Alewife
    MWStation *station0001 = [[MWStation alloc] init];
    station0001.identifier = @"station0001";
    [edge0001.elements addObject:station0001];
    
    station0001.nameOriginal = @"Alewife";
    station0001.geoLocation = CGPointMake(42.3964, -71.142);
    station0001.mapLocation = CGPointMake(1253.5, 461.5);

    MWDrawFillCircle *fillCircle0001 = [[MWDrawFillCircle alloc] init];
    fillCircle0001.center = station0001.mapLocation;
    fillCircle0001.radius = 16;
    fillCircle0001.fillColor = line0001.color;
    [station0001.drawPrimitives addObject:fillCircle0001];

    MWDrawFillCircle *fillCircle0002 = [[MWDrawFillCircle alloc] init];
    fillCircle0002.center = station0001.mapLocation;
    fillCircle0002.radius = 9.5;
    fillCircle0002.fillColor = [UIColor whiteColor];
    [station0001.drawPrimitives addObject:fillCircle0002];

    MWDrawTextLine *drawTextLine0001 = [[MWDrawTextLine alloc] init];
    drawTextLine0001.text = @"ALEWIFE";
    drawTextLine0001.fontName = @"Baskerville";
    drawTextLine0001.fontColor = [UIColor blackColor];
    drawTextLine0001.fontSize = 36;
    drawTextLine0001.origin = CGPointMake(1040, 440.5);
    [station0001.nameOriginalTextPrimitives addObject:drawTextLine0001];
    
    // Добавляем перегон
    MWHaul *haul0001 = [[MWHaul alloc] init];
    haul0001.identifier = @"haul0001";
    haul0001.length = 1559;
    [edge0001.elements addObject:haul0001];

    MWDrawLine *drawLine0001 = [[MWDrawLine alloc] init];
    drawLine0001.startPoint = station0001.mapLocation;
    drawLine0001.endPoint = CGPointMake(1369.5, 577.5);
    drawLine0001.width = 32;
    drawLine0001.color = line0001.color;
    [haul0001.drawPrimitives addObject:drawLine0001];

    // Добавляем станцию Davis
    MWStation *station0002 = [[MWStation alloc] init];
    station0002.identifier = @"station0002";
    [edge0001.elements addObject:station0002];
    
    station0002.nameOriginal = @"Davis";
    station0002.geoLocation = CGPointMake(42.397, -71.123);
    station0002.mapLocation = CGPointMake(1369.5, 577.5);

    MWDrawFillCircle *fillCircle0003 = [[MWDrawFillCircle alloc] init];
    fillCircle0003.center = station0002.mapLocation;
    fillCircle0003.radius = 9.5;
    fillCircle0003.fillColor = [UIColor whiteColor];
    [station0002.drawPrimitives addObject:fillCircle0003];

    MWDrawTextLine *drawTextLine0002 = [[MWDrawTextLine alloc] init];
    drawTextLine0002.text = station0002.nameOriginal;
    drawTextLine0002.fontName = @"Baskerville";
    drawTextLine0002.fontColor = [UIColor blackColor];
    drawTextLine0002.fontSize = 34;
    drawTextLine0002.origin = CGPointMake(1230, 565);
    drawTextLine0002.kernSpacing = - 1.0;
    [station0002.nameOriginalTextPrimitives addObject:drawTextLine0002];

    // Добавляем перегон
    MWHaul *haul0002 = [[MWHaul alloc] init];
    haul0002.identifier = @"haul0002";
    haul0002.length = 1132;
    [edge0001.elements addObject:haul0002];

    MWDrawLine *drawLine0002 = [[MWDrawLine alloc] init];
    drawLine0002.startPoint = CGPointMake(1369, 577);
    drawLine0002.endPoint = CGPointMake(1485.5, 694.5);
    drawLine0002.width = 32;
    drawLine0002.color = line0001.color;
    [haul0002.drawPrimitives addObject:drawLine0002];

    // Добавляем станцию Porter
    MWStation *station0003 = [[MWStation alloc] init];
    station0003.identifier = @"station0003";
    [edge0001.elements addObject:station0003];
    
    station0003.nameOriginal = @"Porter";
    station0003.geoLocation = CGPointMake(42.388333, -71.119028);
    station0003.mapLocation = CGPointMake(1485.5, 694.5);

    MWDrawFillCircle *fillCircle0004 = [[MWDrawFillCircle alloc] init];
    fillCircle0004.center = station0003.mapLocation;
    fillCircle0004.radius = 9.5;
    fillCircle0004.fillColor = [UIColor whiteColor];
    [station0003.drawPrimitives addObject:fillCircle0004];

    MWDrawTextLine *drawTextLine0003 = [[MWDrawTextLine alloc] init];
    drawTextLine0003.text = station0003.nameOriginal;
    drawTextLine0003.fontName = @"Baskerville";
    drawTextLine0003.fontColor = [UIColor blackColor];
    drawTextLine0003.fontSize = 34;
    drawTextLine0003.origin = CGPointMake(1305, 670);
    drawTextLine0003.kernSpacing = - 1.4;
    [station0003.nameOriginalTextPrimitives addObject:drawTextLine0003];

    // Добавляем перегон
    MWHaul *haul0003 = [[MWHaul alloc] init];
    haul0003.identifier = @"haul0003";
    haul0003.length = 1668;
    [edge0001.elements addObject:haul0003];

    MWDrawLine *drawLine0003 = [[MWDrawLine alloc] init];
    drawLine0003.startPoint = CGPointMake(1485, 694);
    drawLine0003.endPoint = CGPointMake(1601.5, 809);
    drawLine0003.width = 32;
    drawLine0003.color = line0001.color;
    [haul0003.drawPrimitives addObject:drawLine0003];

    // Добавляем станцию Harvard
    MWStation *station0004 = [[MWStation alloc] init];
    station0004.identifier = @"station0004";
    [edge0001.elements addObject:station0004];
    
    station0004.nameOriginal = @"Harvard";
    station0004.geoLocation = CGPointMake(42.3734, -71.1193);
    station0004.mapLocation = CGPointMake(1601.5, 809);

    MWDrawFillCircle *fillCircle0005 = [[MWDrawFillCircle alloc] init];
    fillCircle0005.center = station0004.mapLocation;
    fillCircle0005.radius = 9.5;
    fillCircle0005.fillColor = [UIColor whiteColor];
    [station0004.drawPrimitives addObject:fillCircle0005];

    MWDrawTextLine *drawTextLine0004 = [[MWDrawTextLine alloc] init];
    drawTextLine0004.text = station0004.nameOriginal;
    drawTextLine0004.fontName = @"Baskerville";
    drawTextLine0004.fontColor = [UIColor blackColor];
    drawTextLine0004.fontSize = 34;
    drawTextLine0004.origin = CGPointMake(1409, 772);
    drawTextLine0004.kernSpacing = - 2.8;
    [station0004.nameOriginalTextPrimitives addObject:drawTextLine0004];

    // Добавляем перегон
    MWHaul *haul0004 = [[MWHaul alloc] init];
    haul0004.identifier = @"haul0004";
    haul0004.length = 1617;
    [edge0001.elements addObject:haul0004];

    MWDrawLine *drawLine0004 = [[MWDrawLine alloc] init];
    drawLine0004.startPoint = CGPointMake(1601, 808.5);
    drawLine0004.endPoint = CGPointMake(1717.5, 927);
    drawLine0004.width = 32;
    drawLine0004.color = line0001.color;
    [haul0004.drawPrimitives addObject:drawLine0004];

    // Добавляем станцию Central
    MWStation *station0005 = [[MWStation alloc] init];
    station0005.identifier = @"station0005";
    [edge0001.elements addObject:station0005];
    
    station0005.nameOriginal = @"Central";
    station0005.geoLocation = CGPointMake(42.365, -71.1034);
    station0005.mapLocation = CGPointMake(1717.5, 927);

    MWDrawFillCircle *fillCircle0006 = [[MWDrawFillCircle alloc] init];
    fillCircle0006.center = station0005.mapLocation;
    fillCircle0006.radius = 9.5;
    fillCircle0006.fillColor = [UIColor whiteColor];
    [station0005.drawPrimitives addObject:fillCircle0006];

    MWDrawTextLine *drawTextLine0005 = [[MWDrawTextLine alloc] init];
    drawTextLine0005.text = station0005.nameOriginal;
    drawTextLine0005.fontName = @"Baskerville";
    drawTextLine0005.fontColor = [UIColor blackColor];
    drawTextLine0005.fontSize = 34;
    drawTextLine0005.origin = CGPointMake(1544, 931);
    drawTextLine0005.kernSpacing = -2.2;
    [station0005.nameOriginalTextPrimitives addObject:drawTextLine0005];

    // Добавляем перегон
    MWHaul *haul0005 = [[MWHaul alloc] init];
    haul0005.identifier = @"haul0005";
    haul0005.length = 1474;
    [edge0001.elements addObject:haul0005];

    MWDrawLine *drawLine0005 = [[MWDrawLine alloc] init];
    drawLine0005.startPoint = CGPointMake(1717, 926.5);
    drawLine0005.endPoint = CGPointMake(1833.5, 1043);
    drawLine0005.width = 32;
    drawLine0005.color = line0001.color;
    [haul0005.drawPrimitives addObject:drawLine0005];

    // Добавляем станцию Kendall/MIT
    MWStation *station0006 = [[MWStation alloc] init];
    station0006.identifier = @"station0006";
    [edge0001.elements addObject:station0006];
    
    station0006.nameOriginal = @"Kendall/MIT";
    station0006.geoLocation = CGPointMake(42.3623, -71.0862);
    station0006.mapLocation = CGPointMake(1833.5, 1043);

    MWDrawFillCircle *fillCircle0007 = [[MWDrawFillCircle alloc] init];
    fillCircle0007.center = station0006.mapLocation;
    fillCircle0007.radius = 9.5;
    fillCircle0007.fillColor = [UIColor whiteColor];
    [station0006.drawPrimitives addObject:fillCircle0007];

    MWDrawTextLine *drawTextLine0006 = [[MWDrawTextLine alloc] init];
    drawTextLine0006.text = station0006.nameOriginal;
    drawTextLine0006.fontName = @"Baskerville";
    drawTextLine0006.fontColor = [UIColor blackColor];
    drawTextLine0006.fontSize = 34;
    drawTextLine0006.origin = CGPointMake(1622, 1046);
    drawTextLine0006.kernSpacing = -3.0;
    [station0006.nameOriginalTextPrimitives addObject:drawTextLine0006];

    // Добавляем перегон
    MWHaul *haul0006 = [[MWHaul alloc] init];
    haul0006.identifier = @"haul0006";
    haul0006.length = 1228;
    [edge0001.elements addObject:haul0006];

    MWDrawLine *drawLine0006 = [[MWDrawLine alloc] init];
    drawLine0006.startPoint = CGPointMake(1833, 1042.5);
    drawLine0006.endPoint = CGPointMake(1972.5, 1182.5);
    drawLine0006.width = 32;
    drawLine0006.color = line0001.color;
    [haul0006.drawPrimitives addObject:drawLine0006];

    // Добавляем станцию Charles/MGH
    MWStation *station0007 = [[MWStation alloc] init];
    station0007.identifier = @"station0007";
    [edge0001.elements addObject:station0007];
    
    station0007.nameOriginal = @"Charles/MGH";
    station0007.geoLocation = CGPointMake(42.3613, -71.0714);
    station0007.mapLocation = CGPointMake(1972.5, 1182.5);

    MWDrawFillCircle *fillCircle0008 = [[MWDrawFillCircle alloc] init];
    fillCircle0008.center = station0007.mapLocation;
    fillCircle0008.radius = 9.5;
    fillCircle0008.fillColor = [UIColor whiteColor];
    [station0007.drawPrimitives addObject:fillCircle0008];

    MWDrawTextLine *drawTextLine0007 = [[MWDrawTextLine alloc] init];
    drawTextLine0007.text = @"Charles/";
    drawTextLine0007.fontName = @"Baskerville";
    drawTextLine0007.fontColor = [UIColor blackColor];
    drawTextLine0007.fontSize = 34;
    drawTextLine0007.origin = CGPointMake(1791, 1166.5);
    drawTextLine0007.kernSpacing = -2.4;
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0007];

    MWDrawTextLine *drawTextLine0008 = [[MWDrawTextLine alloc] init];
    drawTextLine0008.text = @"MGH";
    drawTextLine0008.fontName = @"Baskerville";
    drawTextLine0008.fontColor = [UIColor blackColor];
    drawTextLine0008.fontSize = 34;
    drawTextLine0008.origin = CGPointMake(1832, 1201);
    drawTextLine0008.kernSpacing = -5.0;
    [station0007.nameOriginalTextPrimitives addObject:drawTextLine0008];

    // Добавляем перегон
    MWHaul *haul0007 = [[MWHaul alloc] init];
    haul0007.identifier = @"haul0007";
    haul0007.length = 929;
    [edge0001.elements addObject:haul0007];

    MWDrawLine *drawLine0007 = [[MWDrawLine alloc] init];
    drawLine0007.startPoint = CGPointMake(1972, 1182);
    drawLine0007.endPoint = CGPointMake(2065.5, 1275);
    drawLine0007.width = 32;
    drawLine0007.color = line0001.color;
    [haul0007.drawPrimitives addObject:drawLine0007];

    // Добавляем станцию Park St
    MWStation *station0008 = [[MWStation alloc] init];
    station0008.identifier = @"station0008";
    [edge0001.elements addObject:station0008];
    
    station0008.nameOriginal = @"Park Street";
    station0008.geoLocation = CGPointMake(42.356389, -71.0625);
    station0008.mapLocation = CGPointMake(2065.5, 1275);

    MWDrawFillCircle *fillCircle0009 = [[MWDrawFillCircle alloc] init];
    fillCircle0009.center = station0008.mapLocation;
    fillCircle0009.radius = 9.5;
    fillCircle0009.fillColor = [UIColor whiteColor];
    [station0008.drawPrimitives addObject:fillCircle0009];

    MWDrawTextLine *drawTextLine0009 = [[MWDrawTextLine alloc] init];
    drawTextLine0009.text = @"Park St";
    drawTextLine0009.fontName = @"Baskerville";
    drawTextLine0009.fontColor = [UIColor blackColor];
    drawTextLine0009.fontSize = 34;
    drawTextLine0009.origin = CGPointMake(1895, 1255);
    drawTextLine0009.kernSpacing = -1.0;
    [station0008.nameOriginalTextPrimitives addObject:drawTextLine0009];

    // Добавляем вершину
    edge0001.finishVertex = vertex0002;

    // Создаем участок линии Park St - Downtown Crossing
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0002 = [[MWEdge alloc] init];
    edge0002.identifier = @"edge0002";
    edge0002.developmentName = @"Ребро: Park St - Downtown Crossing";
    [self.edges addObject:edge0002];
    
    // Добавляем линию
    edge0002.line = line0001;
    
    // Добавляем вершину
    edge0002.startVertex = vertex0002;

    // Добавляем станцию Park St
    [edge0002.elements addObject:station0008];

    // Добавляем перегон
    MWHaul *haul0008 = [[MWHaul alloc] init];
    haul0008.identifier = @"haul0008";
    haul0008.length = 193;
    [edge0002.elements addObject:haul0008];

    MWDrawLine *drawLine0008 = [[MWDrawLine alloc] init];
    drawLine0008.startPoint = CGPointMake(2065, 1274.5);
    drawLine0008.endPoint = CGPointMake(2202.5, 1412);
    drawLine0008.width = 32;
    drawLine0008.color = line0001.color;
    [haul0008.drawPrimitives addObject:drawLine0008];

    // Добавляем станцию Downtown Crossing
    MWStation *station0009 = [[MWStation alloc] init];
    station0009.identifier = @"station0009";
    [edge0002.elements addObject:station0009];
    
    station0009.nameOriginal = @"Downtown Crossing";
    station0009.geoLocation = CGPointMake(42.3555, -71.0605);
    station0009.mapLocation = CGPointMake(2202.5, 1412);

    MWDrawFillCircle *fillCircle0010 = [[MWDrawFillCircle alloc] init];
    fillCircle0010.center = station0009.mapLocation;
    fillCircle0010.radius = 9.5;
    fillCircle0010.fillColor = [UIColor whiteColor];
    [station0009.drawPrimitives addObject:fillCircle0010];

    MWDrawTextLine *drawTextLine0010 = [[MWDrawTextLine alloc] init];
    drawTextLine0010.text = @"Downtown";
    drawTextLine0010.fontName = @"Baskerville";
    drawTextLine0010.fontColor = [UIColor blackColor];
    drawTextLine0010.fontSize = 34;
    drawTextLine0010.origin = CGPointMake(2273, 1359.5);
    drawTextLine0010.kernSpacing = -2.6;
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0010];

    MWDrawTextLine *drawTextLine0011 = [[MWDrawTextLine alloc] init];
    drawTextLine0011.text = @"Crossing";
    drawTextLine0011.fontName = @"Baskerville";
    drawTextLine0011.fontColor = [UIColor blackColor];
    drawTextLine0011.fontSize = 34;
    drawTextLine0011.origin = CGPointMake(2273, 1391);
    drawTextLine0011.kernSpacing = -1.9;
    [station0009.nameOriginalTextPrimitives addObject:drawTextLine0011];

    // Добавляем вершину
    edge0002.finishVertex = vertex0003;

    // Создаем участок линии Downtown Crossing - South Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0003 = [[MWEdge alloc] init];
    edge0003.identifier = @"edge0003";
    edge0003.developmentName = @"Ребро: Downtown Crossing - South Station";
    [self.edges addObject:edge0003];
    
    // Добавляем линию
    edge0003.line = line0001;
    
    // Добавляем вершину
    edge0003.startVertex = vertex0003;

    // Добавляем станцию Downtown Crossing
    [edge0003.elements addObject:station0009];

    // Добавляем перегон
    MWHaul *haul0009 = [[MWHaul alloc] init];
    haul0009.identifier = @"haul0009";
    haul0009.length = 535;
    [edge0003.elements addObject:haul0009];

    MWDrawLine *drawLine0009 = [[MWDrawLine alloc] init];
    drawLine0009.startPoint = CGPointMake(2202, 1411.5);
    drawLine0009.endPoint = CGPointMake(2338, 1549);
    drawLine0009.width = 32;
    drawLine0009.color = line0001.color;
    [haul0009.drawPrimitives addObject:drawLine0009];

    // Добавляем станцию South Station
    MWStation *station0010 = [[MWStation alloc] init];
    station0010.identifier = @"station0010";
    [edge0003.elements addObject:station0010];
    
    station0010.nameOriginal = @"South Station";
    station0010.geoLocation = CGPointMake(42.35261, -71.05536);
    station0010.mapLocation = CGPointMake(2338, 1549);
    
    MWDrawFillCircle *fillCircle0011 = [[MWDrawFillCircle alloc] init];
    fillCircle0011.center = station0010.mapLocation;
    fillCircle0011.radius = 9.5;
    fillCircle0011.fillColor = [UIColor whiteColor];
    [station0010.drawPrimitives addObject:fillCircle0011];

    MWDrawTextLine *drawTextLine0012 = [[MWDrawTextLine alloc] init];
    drawTextLine0012.text = @"South";
    drawTextLine0012.fontName = @"Baskerville";
    drawTextLine0012.fontColor = [UIColor blackColor];
    drawTextLine0012.fontSize = 34;
    drawTextLine0012.origin = CGPointMake(2373, 1466);
    drawTextLine0012.kernSpacing = -2.4;
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0012];

    MWDrawTextLine *drawTextLine0013 = [[MWDrawTextLine alloc] init];
    drawTextLine0013.text = @"Station";
    drawTextLine0013.fontName = @"Baskerville";
    drawTextLine0013.fontColor = [UIColor blackColor];
    drawTextLine0013.fontSize = 34;
    drawTextLine0013.origin = CGPointMake(2373, 1497);
    drawTextLine0013.kernSpacing = -2.0;
    [station0010.nameOriginalTextPrimitives addObject:drawTextLine0013];

    // Добавляем вершину
    edge0003.finishVertex = vertex0004;
    
    // Создаем участок линии South Station - JFK/UMass
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0004 = [[MWEdge alloc] init];
    edge0004.identifier = @"edge0004";
    edge0004.developmentName = @"Ребро: South Station - JFK/UMass";
    [self.edges addObject:edge0004];
    
    // Добавляем линию
    edge0004.line = line0001;
    
    // Добавляем вершину
    edge0004.startVertex = vertex0004;

    // Добавляем станцию South Station
    [edge0004.elements addObject:station0010];

    // Добавляем перегон
    MWHaul *haul0010 = [[MWHaul alloc] init];
    haul0010.identifier = @"haul0010";
    haul0010.length = 1241;
    [edge0004.elements addObject:haul0010];

    MWDrawLine *drawLine0010 = [[MWDrawLine alloc] init];
    drawLine0010.startPoint = CGPointMake(2337.5, 1548.5);
    drawLine0010.endPoint = CGPointMake(2406, 1616.75);
    drawLine0010.width = 32;
    drawLine0010.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0010];
    
    MWDrawArc *drawArc0001 = [[MWDrawArc alloc] init];
    drawArc0001.center = CGPointMake(2349, 1673);
    drawArc0001.startRadians = 315 * M_PI / 180;
    drawArc0001.endRadians = 360 * M_PI / 180;
    drawArc0001.radius = 80;
    drawArc0001.width = 32;
    drawArc0001.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawArc0001];
    
    MWDrawLine *drawLine0011 = [[MWDrawLine alloc] init];
    drawLine0011.startPoint = CGPointMake(2429, 1673);
    drawLine0011.endPoint = CGPointMake(2429, 1821);
    drawLine0011.width = 32;
    drawLine0011.color = line0001.color;
    [haul0010.drawPrimitives addObject:drawLine0011];
    
    // Добавляем станцию Broadway
    MWStation *station0011 = [[MWStation alloc] init];
    station0011.identifier = @"station0011";
    [edge0004.elements addObject:station0011];
    
    station0011.nameOriginal = @"Broadway";
    station0011.geoLocation = CGPointMake(42.3429, -71.0572);
    station0011.mapLocation = CGPointMake(2429, 1821);

    MWDrawFillCircle *fillCircle0012 = [[MWDrawFillCircle alloc] init];
    fillCircle0012.center = station0011.mapLocation;
    fillCircle0012.radius = 9.5;
    fillCircle0012.fillColor = [UIColor whiteColor];
    [station0011.drawPrimitives addObject:fillCircle0012];

    MWDrawTextLine *drawTextLine0014 = [[MWDrawTextLine alloc] init];
    drawTextLine0014.text = station0011.nameOriginal;
    drawTextLine0014.fontName = @"Baskerville";
    drawTextLine0014.fontColor = [UIColor blackColor];
    drawTextLine0014.fontSize = 34;
    drawTextLine0014.origin = CGPointMake(2479, 1801);
    drawTextLine0014.kernSpacing = -2.0;
    [station0011.nameOriginalTextPrimitives addObject:drawTextLine0014];

    // Добавляем перегон
    MWHaul *haul0011 = [[MWHaul alloc] init];
    haul0011.identifier = @"haul0011";
    haul0011.length = 1412;
    [edge0004.elements addObject:haul0011];
    
    MWDrawLine *drawLine0012 = [[MWDrawLine alloc] init];
    drawLine0012.startPoint = CGPointMake(2429, 1820.5);
    drawLine0012.endPoint = CGPointMake(2429.5, 1959);
    drawLine0012.width = 32;
    drawLine0012.color = line0001.color;
    [haul0011.drawPrimitives addObject:drawLine0012];

    // Добавляем станцию Andrew
    MWStation *station0012 = [[MWStation alloc] init];
    station0012.identifier = @"station0012";
    [edge0004.elements addObject:station0012];
    
    station0012.nameOriginal = @"Andrew";
    station0012.geoLocation = CGPointMake(42.33019, -71.05712);
    station0012.mapLocation = CGPointMake(2429.5, 1959);
    
    MWDrawFillCircle *fillCircle0013 = [[MWDrawFillCircle alloc] init];
    fillCircle0013.center = station0012.mapLocation;
    fillCircle0013.radius = 9.5;
    fillCircle0013.fillColor = [UIColor whiteColor];
    [station0012.drawPrimitives addObject:fillCircle0013];

    MWDrawTextLine *drawTextLine0015 = [[MWDrawTextLine alloc] init];
    drawTextLine0015.text = station0012.nameOriginal;
    drawTextLine0015.fontName = @"Baskerville";
    drawTextLine0015.fontColor = [UIColor blackColor];
    drawTextLine0015.fontSize = 34;
    drawTextLine0015.origin = CGPointMake(2479, 1939);
    drawTextLine0015.kernSpacing = -2.0;
    [station0012.nameOriginalTextPrimitives addObject:drawTextLine0015];

    // Добавляем перегон
    MWHaul *haul0012 = [[MWHaul alloc] init];
    haul0012.identifier = @"haul0012";
    haul0012.length = 1229;
    [edge0004.elements addObject:haul0012];

    MWDrawLine *drawLine0013 = [[MWDrawLine alloc] init];
    drawLine0013.startPoint = CGPointMake(2429.5, 1958.5);
    drawLine0013.endPoint = CGPointMake(2429.5, 2093);
    drawLine0013.width = 32;
    drawLine0013.color = line0001.color;
    [haul0012.drawPrimitives addObject:drawLine0013];

    // Добавляем станцию JFK/UMass
    MWStation *station0013 = [[MWStation alloc] init];
    station0013.identifier = @"station0013";
    [edge0004.elements addObject:station0013];
    
    station0013.nameOriginal = @"JFK/UMass";
    station0013.geoLocation = CGPointMake(42.32058, -71.05239);
    station0013.mapLocation = CGPointMake(2429.5, 2093);

    MWDrawFillCircle *fillCircle0014 = [[MWDrawFillCircle alloc] init];
    fillCircle0014.center = station0013.mapLocation;
    fillCircle0014.radius = 9.5;
    fillCircle0014.fillColor = [UIColor whiteColor];
    [station0013.drawPrimitives addObject:fillCircle0014];

    MWDrawTextLine *drawTextLine0016 = [[MWDrawTextLine alloc] init];
    drawTextLine0016.text = station0013.nameOriginal;
    drawTextLine0016.fontName = @"Baskerville";
    drawTextLine0016.fontColor = [UIColor blackColor];
    drawTextLine0016.fontSize = 34;
    drawTextLine0016.origin = CGPointMake(2485, 2074);
    drawTextLine0016.kernSpacing = -2.0;
    [station0013.nameOriginalTextPrimitives addObject:drawTextLine0016];

    // Добавляем вершину
    edge0004.finishVertex = vertex0005;

    // Создаем участок линии JFK/UMass - Braintree
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0005 = [[MWEdge alloc] init];
    edge0005.identifier = @"edge0005";
    edge0005.developmentName = @"Ребро: JFK/UMass - Braintree";
    [self.edges addObject:edge0005];
    
    // Добавляем линию
    edge0005.line = line0001;
    
    // Добавляем вершину
    edge0005.startVertex = vertex0005;

    // Добавляем станцию JFK/UMass
    [edge0005.elements addObject:station0013];

    // Добавляем перегон
    MWHaul *haul0013 = [[MWHaul alloc] init];
    haul0013.identifier = @"haul0013";
    haul0013.length = 5727;
    [edge0005.elements addObject:haul0013];

    MWDrawLine *drawLine0014 = [[MWDrawLine alloc] init];
    drawLine0014.startPoint = CGPointMake(2429.5, 2092.5);
    drawLine0014.endPoint = CGPointMake(2429.5, 2186);
    drawLine0014.width = 32;
    drawLine0014.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0014];
    
    MWDrawArc *drawArc0002 = [[MWDrawArc alloc] init];
    drawArc0002.center = CGPointMake(2609.5, 2186);
    drawArc0002.startRadians = 135 * M_PI / 180;
    drawArc0002.endRadians = 180 * M_PI / 180;
    drawArc0002.radius = 180;
    drawArc0002.width = 32;
    drawArc0002.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawArc0002];

    MWDrawLine *drawLine0015 = [[MWDrawLine alloc] init];
    drawLine0015.startPoint = CGPointMake(2481.75, 2312.75);
    drawLine0015.endPoint = CGPointMake(2648, 2477);
    drawLine0015.width = 32;
    drawLine0015.color = line0001.color;
    [haul0013.drawPrimitives addObject:drawLine0015];
    
    // Добавляем станцию North Quincy
    MWStation *station0014 = [[MWStation alloc] init];
    station0014.identifier = @"station0014";
    [edge0005.elements addObject:station0014];
    
    station0014.nameOriginal = @"North Quincy";
    station0014.geoLocation = CGPointMake(42.2758, -71.0302);
    station0014.mapLocation = CGPointMake(2648, 2477);

    MWDrawFillCircle *fillCircle0015 = [[MWDrawFillCircle alloc] init];
    fillCircle0015.center = station0014.mapLocation;
    fillCircle0015.radius = 9.5;
    fillCircle0015.fillColor = [UIColor whiteColor];
    [station0014.drawPrimitives addObject:fillCircle0015];

    MWDrawTextLine *drawTextLine0017 = [[MWDrawTextLine alloc] init];
    drawTextLine0017.text = station0014.nameOriginal;
    drawTextLine0017.fontName = @"Baskerville";
    drawTextLine0017.fontColor = [UIColor blackColor];
    drawTextLine0017.fontSize = 34;
    drawTextLine0017.origin = CGPointMake(2714, 2457);
    drawTextLine0017.kernSpacing = -2.5;
    [station0014.nameOriginalTextPrimitives addObject:drawTextLine0017];

    // Добавляем перегон
    MWHaul *haul0014 = [[MWHaul alloc] init];
    haul0014.identifier = @"haul0014";
    haul0014.length = 1428;
    [edge0005.elements addObject:haul0014];

    MWDrawLine *drawLine0016 = [[MWDrawLine alloc] init];
    drawLine0016.startPoint = CGPointMake(2647.5, 2476.5);
    drawLine0016.endPoint = CGPointMake(2738.5, 2567.5);
    drawLine0016.width = 32;
    drawLine0016.color = line0001.color;
    [haul0014.drawPrimitives addObject:drawLine0016];

    // Добавляем станцию Wollaston
    MWStation *station0015 = [[MWStation alloc] init];
    station0015.identifier = @"station0015";
    [edge0005.elements addObject:station0015];
    
    station0015.nameOriginal = @"Wollaston";
    station0015.geoLocation = CGPointMake(42.265638, -71.01953);
    station0015.mapLocation = CGPointMake(2738.5, 2567.5);

    MWDrawFillCircle *fillCircle0016 = [[MWDrawFillCircle alloc] init];
    fillCircle0016.center = station0015.mapLocation;
    fillCircle0016.radius = 9.5;
    fillCircle0016.fillColor = [UIColor whiteColor];
    [station0015.drawPrimitives addObject:fillCircle0016];

    MWDrawTextLine *drawTextLine0018 = [[MWDrawTextLine alloc] init];
    drawTextLine0018.text = station0015.nameOriginal;
    drawTextLine0018.fontName = @"Baskerville";
    drawTextLine0018.fontColor = [UIColor blackColor];
    drawTextLine0018.fontSize = 34;
    drawTextLine0018.origin = CGPointMake(2778, 2545.5);
    drawTextLine0018.kernSpacing = -1.4;
    [station0015.nameOriginalTextPrimitives addObject:drawTextLine0018];

    // Добавляем перегон
    MWHaul *haul0015 = [[MWHaul alloc] init];
    haul0015.identifier = @"haul0015";
    haul0015.length = 2050;
    [edge0005.elements addObject:haul0015];
    
    MWDrawLine *drawLine0017 = [[MWDrawLine alloc] init];
    drawLine0017.startPoint = CGPointMake(2738, 2567);
    drawLine0017.endPoint = CGPointMake(2829.5, 2658);
    drawLine0017.width = 32;
    drawLine0017.color = line0001.color;
    [haul0015.drawPrimitives addObject:drawLine0017];

    // Добавляем станцию Quincy Center
    MWStation *station0016 = [[MWStation alloc] init];
    station0016.identifier = @"station0016";
    [edge0005.elements addObject:station0016];
    
    station0016.nameOriginal = @"Quincy Center";
    station0016.geoLocation = CGPointMake(42.250878, -71.004797);
    station0016.mapLocation = CGPointMake(2829.5, 2658);

    MWDrawFillCircle *fillCircle0017 = [[MWDrawFillCircle alloc] init];
    fillCircle0017.center = station0016.mapLocation;
    fillCircle0017.radius = 9.5;
    fillCircle0017.fillColor = [UIColor whiteColor];
    [station0016.drawPrimitives addObject:fillCircle0017];

    MWDrawTextLine *drawTextLine0019 = [[MWDrawTextLine alloc] init];
    drawTextLine0019.text = station0016.nameOriginal;
    drawTextLine0019.fontName = @"Baskerville";
    drawTextLine0019.fontColor = [UIColor blackColor];
    drawTextLine0019.fontSize = 34;
    drawTextLine0019.origin = CGPointMake(2899, 2637);
    drawTextLine0019.kernSpacing = -2.2;
    [station0016.nameOriginalTextPrimitives addObject:drawTextLine0019];

    // Добавляем перегон
    MWHaul *haul0016 = [[MWHaul alloc] init];
    haul0016.identifier = @"haul0016";
    haul0016.length = 2021;
    [edge0005.elements addObject:haul0016];

    MWDrawLine *drawLine0018 = [[MWDrawLine alloc] init];
    drawLine0018.startPoint = CGPointMake(2829, 2657.5);
    drawLine0018.endPoint = CGPointMake(2865, 2692.5);
    drawLine0018.width = 32;
    drawLine0018.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawLine0018];

    MWDrawArc *drawArc0003 = [[MWDrawArc alloc] init];
    drawArc0003.center = CGPointMake(2795, 2764);
    drawArc0003.startRadians = 314 * M_PI / 180;
    drawArc0003.endRadians = 354 * M_PI / 180;
    drawArc0003.radius = 100;
    drawArc0003.width = 32;
    drawArc0003.color = line0001.color;
    [haul0016.drawPrimitives addObject:drawArc0003];

    // Добавляем станцию Quincy Adams
    MWStation *station0017 = [[MWStation alloc] init];
    station0017.identifier = @"station0017";
    [edge0005.elements addObject:station0017];
    
    station0017.nameOriginal = @"Quincy Adams";
    station0017.geoLocation = CGPointMake(42.232894, -71.008083);
    station0017.mapLocation = CGPointMake(2894, 2753);
    
    MWDrawFillCircle *fillCircle0018 = [[MWDrawFillCircle alloc] init];
    fillCircle0018.center = station0017.mapLocation;
    fillCircle0018.radius = 9.5;
    fillCircle0018.fillColor = [UIColor whiteColor];
    [station0017.drawPrimitives addObject:fillCircle0018];

    MWDrawTextLine *drawTextLine0020 = [[MWDrawTextLine alloc] init];
    drawTextLine0020.text = station0017.nameOriginal;
    drawTextLine0020.fontName = @"Baskerville";
    drawTextLine0020.fontColor = [UIColor blackColor];
    drawTextLine0020.fontSize = 34;
    drawTextLine0020.origin = CGPointMake(2945, 2732);
    drawTextLine0020.kernSpacing = -2.3;
    [station0017.nameOriginalTextPrimitives addObject:drawTextLine0020];

    // Добавляем перегон
    MWHaul *haul0017 = [[MWHaul alloc] init];
    haul0017.identifier = @"haul0017";
    haul0017.length = 2979;
    [edge0005.elements addObject:haul0017];

    MWDrawArc *drawArc0004 = [[MWDrawArc alloc] init];
    drawArc0004.center = CGPointMake(2795, 2764);
    drawArc0004.startRadians = 353.5 * M_PI / 180;
    drawArc0004.endRadians = 360 * M_PI / 180;
    drawArc0004.radius = 100;
    drawArc0004.width = 32;
    drawArc0004.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawArc0004];

    MWDrawLine *drawLine0019 = [[MWDrawLine alloc] init];
    drawLine0019.startPoint = CGPointMake(2895, 2764);
    drawLine0019.endPoint = CGPointMake(2895, 2892);
    drawLine0019.width = 32;
    drawLine0019.color = line0001.color;
    [haul0017.drawPrimitives addObject:drawLine0019];

    // Добавляем станцию Braintree
    MWStation *station0018 = [[MWStation alloc] init];
    station0018.identifier = @"station0018";
    [edge0005.elements addObject:station0018];
    
    station0018.nameOriginal = @"Braintree";
    station0018.geoLocation = CGPointMake(42.2074, -71.0014);
    station0018.mapLocation = CGPointMake(2895, 2892);
    
    MWDrawFillCircle *fillCircle0019 = [[MWDrawFillCircle alloc] init];
    fillCircle0019.center = station0018.mapLocation;
    fillCircle0019.radius = 16;
    fillCircle0019.fillColor = line0001.color;
    [station0018.drawPrimitives addObject:fillCircle0019];
    
    MWDrawFillCircle *fillCircle0020 = [[MWDrawFillCircle alloc] init];
    fillCircle0020.center = station0018.mapLocation;
    fillCircle0020.radius = 9.5;
    fillCircle0020.fillColor = [UIColor whiteColor];
    [station0018.drawPrimitives addObject:fillCircle0020];

    MWDrawTextLine *drawTextLine0021 = [[MWDrawTextLine alloc] init];
    drawTextLine0021.text = @"BRAINTREE";
    drawTextLine0021.fontName = @"Baskerville";
    drawTextLine0021.fontColor = [UIColor blackColor];
    drawTextLine0021.fontSize = 36;
    drawTextLine0021.origin = CGPointMake(2945, 2874.5);
    drawTextLine0021.kernSpacing = -0.6;
    [station0018.nameOriginalTextPrimitives addObject:drawTextLine0021];

    // Добавляем вершину
    edge0005.finishVertex = vertex0006;

    // Создаем участок линии JFK/UMass - Ashmont
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0006 = [[MWEdge alloc] init];
    edge0006.identifier = @"edge0006";
    edge0006.developmentName = @"Ребро: JFK/UMass - Ashmont";
    [self.edges addObject:edge0006];
    
    // Добавляем линию
    edge0006.line = line0001;
    
    // Добавляем вершину
    edge0006.startVertex = vertex0005;
    
    // Добавляем станцию JFK/UMass
    [edge0006.elements addObject:station0013];
    
    // Добавляем перегон
    MWHaul *haul0018 = [[MWHaul alloc] init];
    haul0018.identifier = @"haul0018";
    haul0018.length = 1121;
    [edge0006.elements addObject:haul0018];

    MWDrawLine *drawLine0020 = [[MWDrawLine alloc] init];
    drawLine0020.startPoint = CGPointMake(2429.5, 2092.5);
    drawLine0020.endPoint = CGPointMake(2429.5, 2236);
    drawLine0020.width = 32;
    drawLine0020.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0020];
    
    MWDrawArc *drawArc0005 = [[MWDrawArc alloc] init];
    drawArc0005.center = CGPointMake(2350, 2225);
    drawArc0005.startRadians = 0 * M_PI / 180;
    drawArc0005.endRadians = 45 * M_PI / 180;
    drawArc0005.radius = 80;
    drawArc0005.width = 32;
    drawArc0005.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawArc0005];

    MWDrawLine *drawLine0021 = [[MWDrawLine alloc] init];
    drawLine0021.startPoint = CGPointMake(2407, 2281);
    drawLine0021.endPoint = CGPointMake(2335, 2353);
    drawLine0021.width = 32;
    drawLine0021.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawLine0021];
    
    MWDrawArc *drawArc0006 = [[MWDrawArc alloc] init];
    drawArc0006.center = CGPointMake(2420.5, 2437.5);
    drawArc0006.startRadians = 192 * M_PI / 180;
    drawArc0006.endRadians = 225 * M_PI / 180;
    drawArc0006.radius = 120;
    drawArc0006.width = 32;
    drawArc0006.color = line0001.color;
    [haul0018.drawPrimitives addObject:drawArc0006];

    // Добавляем станцию Savin Hill
    MWStation *station0019 = [[MWStation alloc] init];
    station0019.identifier = @"station0019";
    [edge0006.elements addObject:station0019];
    
    station0019.nameOriginal = @"Savin Hill";
    station0019.geoLocation = CGPointMake(42.310647, -71.053620);
    station0019.mapLocation = CGPointMake(2303, 2412);

    MWDrawFillCircle *fillCircle0021 = [[MWDrawFillCircle alloc] init];
    fillCircle0021.center = station0019.mapLocation;
    fillCircle0021.radius = 9.5;
    fillCircle0021.fillColor = [UIColor whiteColor];
    [station0019.drawPrimitives addObject:fillCircle0021];

    MWDrawTextLine *drawTextLine0022 = [[MWDrawTextLine alloc] init];
    drawTextLine0022.text = station0019.nameOriginal;
    drawTextLine0022.fontName = @"Baskerville";
    drawTextLine0022.fontColor = [UIColor blackColor];
    drawTextLine0022.fontSize = 34;
    drawTextLine0022.origin = CGPointMake(2353, 2391);
    drawTextLine0022.kernSpacing = -1.4;
    [station0019.nameOriginalTextPrimitives addObject:drawTextLine0022];

    // Добавляем перегон
    MWHaul *haul0019 = [[MWHaul alloc] init];
    haul0019.identifier = @"haul0019";
    haul0019.length = 1575;
    [edge0006.elements addObject:haul0019];

    MWDrawArc *drawArc0007 = [[MWDrawArc alloc] init];
    drawArc0007.center = CGPointMake(2420.5, 2437.5);
    drawArc0007.startRadians = 180 * M_PI / 180;
    drawArc0007.endRadians = 192.5 * M_PI / 180;
    drawArc0007.radius = 120;
    drawArc0007.width = 32;
    drawArc0007.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawArc0007];

    MWDrawLine *drawLine0022 = [[MWDrawLine alloc] init];
    drawLine0022.startPoint = CGPointMake(2300.5, 2437);
    drawLine0022.endPoint = CGPointMake(2300.5, 2476.5);
    drawLine0022.width = 32;
    drawLine0022.color = line0001.color;
    [haul0019.drawPrimitives addObject:drawLine0022];

    // Добавляем станцию Fields Corner
    MWStation *station0020 = [[MWStation alloc] init];
    station0020.identifier = @"station0020";
    [edge0006.elements addObject:station0020];
    
    station0020.nameOriginal = @"Fields Corner";
    station0020.geoLocation = CGPointMake(42.299820, -71.061565);
    station0020.mapLocation = CGPointMake(2300.5, 2476.5);

    MWDrawFillCircle *fillCircle0022 = [[MWDrawFillCircle alloc] init];
    fillCircle0022.center = station0020.mapLocation;
    fillCircle0022.radius = 9.5;
    fillCircle0022.fillColor = [UIColor whiteColor];
    [station0020.drawPrimitives addObject:fillCircle0022];

    MWDrawTextLine *drawTextLine0023 = [[MWDrawTextLine alloc] init];
    drawTextLine0023.text = station0020.nameOriginal;
    drawTextLine0023.fontName = @"Baskerville";
    drawTextLine0023.fontColor = [UIColor blackColor];
    drawTextLine0023.fontSize = 34;
    drawTextLine0023.origin = CGPointMake(2349, 2455);
    drawTextLine0023.kernSpacing = -1.7;
    [station0020.nameOriginalTextPrimitives addObject:drawTextLine0023];

    // Добавляем перегон
    MWHaul *haul0020 = [[MWHaul alloc] init];
    haul0020.identifier = @"haul0020";
    haul0020.length = 976;
    [edge0006.elements addObject:haul0020];

    MWDrawLine *drawLine0023 = [[MWDrawLine alloc] init];
    drawLine0023.startPoint = CGPointMake(2300.5, 2476);
    drawLine0023.endPoint = CGPointMake(2300.5, 2538);
    drawLine0023.width = 32;
    drawLine0023.color = line0001.color;
    [haul0020.drawPrimitives addObject:drawLine0023];

    // Добавляем станцию Shawmut
    MWStation *station0021 = [[MWStation alloc] init];
    station0021.identifier = @"station0021";
    [edge0006.elements addObject:station0021];
    
    station0021.nameOriginal = @"Shawmut";
    station0021.geoLocation = CGPointMake(42.293135, -71.065738);
    station0021.mapLocation = CGPointMake(2300.5, 2538);

    MWDrawFillCircle *fillCircle0023 = [[MWDrawFillCircle alloc] init];
    fillCircle0023.center = station0021.mapLocation;
    fillCircle0023.radius = 9.5;
    fillCircle0023.fillColor = [UIColor whiteColor];
    [station0021.drawPrimitives addObject:fillCircle0023];

    MWDrawTextLine *drawTextLine0024 = [[MWDrawTextLine alloc] init];
    drawTextLine0024.text = station0021.nameOriginal;
    drawTextLine0024.fontName = @"Baskerville";
    drawTextLine0024.fontColor = [UIColor blackColor];
    drawTextLine0024.fontSize = 34;
    drawTextLine0024.origin = CGPointMake(2351, 2516);
    drawTextLine0024.kernSpacing = -2.4;
    [station0021.nameOriginalTextPrimitives addObject:drawTextLine0024];

    // Добавляем перегон
    MWHaul *haul0021 = [[MWHaul alloc] init];
    haul0021.identifier = @"haul0021";
    haul0021.length = 995;
    [edge0006.elements addObject:haul0021];

    MWDrawLine *drawLine0024 = [[MWDrawLine alloc] init];
    drawLine0024.startPoint = CGPointMake(2300.5, 2537.5);
    drawLine0024.endPoint = CGPointMake(2300.5, 2599.5);
    drawLine0024.width = 32;
    drawLine0024.color = line0001.color;
    [haul0021.drawPrimitives addObject:drawLine0024];

    // Добавляем станцию Ashmont
    MWStation *station0022 = [[MWStation alloc] init];
    station0022.identifier = @"station0022";
    [edge0006.elements addObject:station0022];
    
    station0022.nameOriginal = @"Ashmont";
    station0022.geoLocation = CGPointMake(42.2843, -71.0638);
    station0022.mapLocation = CGPointMake(2301, 2599.5);

    MWDrawFillCircle *fillCircle0024 = [[MWDrawFillCircle alloc] init];
    fillCircle0024.center = station0022.mapLocation;
    fillCircle0024.radius = 16;
    fillCircle0024.fillColor = line0001.color;
    [station0022.drawPrimitives addObject:fillCircle0024];

    MWDrawFillCircle *fillCircle0025 = [[MWDrawFillCircle alloc] init];
    fillCircle0025.center = station0022.mapLocation;
    fillCircle0025.radius = 9.5;
    fillCircle0025.fillColor = [UIColor whiteColor];
    [station0022.drawPrimitives addObject:fillCircle0025];

    MWDrawTextLine *drawTextLine0025 = [[MWDrawTextLine alloc] init];
    drawTextLine0025.text = @"ASHMONT";
    drawTextLine0025.fontName = @"Baskerville";
    drawTextLine0025.fontColor = [UIColor blackColor];
    drawTextLine0025.fontSize = 36;
    drawTextLine0025.kernSpacing = -1.4;
    drawTextLine0025.origin = CGPointMake(2351, 2580);
    [station0022.nameOriginalTextPrimitives addObject:drawTextLine0025];
    
    // Добавляем вершину
    edge0006.finishVertex = vertex0007;

    ////////////////////////////////////////////////////////////////
    // 2. Mattapan Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Ashmont - Mattapan
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0007 = [[MWEdge alloc] init];
    edge0007.identifier = @"edge0007";
    edge0007.developmentName = @"Ребро: Ashmont - Mattapan";
    [self.edges addObject:edge0007];
    
    // Добавляем линию
    edge0007.line = line0002;
    
    // Добавляем вершину
    edge0007.startVertex = vertex0007;
    
    // Добавляем станцию Ashmont
    MWStation *station0023 = [[MWStation alloc] init];
    station0023.identifier = @"station0023";
    [edge0007.elements addObject:station0023];
    
    station0023.nameOriginal = @"Ashmont";
    station0023.geoLocation = CGPointMake(42.2843, -71.0638);
    station0023.mapLocation = CGPointMake(2301, 2636.5);
    station0023.showNameOnMap = NO;
    [station0023.nameOriginalTextPrimitives addObject:drawTextLine0025];
    
    MWDrawFillCircle *fillCircle0026 = [[MWDrawFillCircle alloc] init];
    fillCircle0026.center = station0023.mapLocation;
    fillCircle0026.radius = 16;
    fillCircle0026.fillColor = line0002.color;
    [station0023.drawPrimitives addObject:fillCircle0026];
    
    MWDrawFillCircle *fillCircle0027 = [[MWDrawFillCircle alloc] init];
    fillCircle0027.center = station0023.mapLocation;
    fillCircle0027.radius = 9.5;
    fillCircle0027.fillColor = [UIColor whiteColor];
    [station0023.drawPrimitives addObject:fillCircle0027];

    // Добавляем перегон
    MWHaul *haul0022 = [[MWHaul alloc] init];
    haul0022.identifier = @"haul0022";
    haul0022.length = 583;
    [edge0007.elements addObject:haul0022];

    MWDrawLine *drawLine0025 = [[MWDrawLine alloc] init];
    drawLine0025.startPoint = CGPointMake(2301, 2636.5);
    drawLine0025.endPoint = CGPointMake(2300.5, 2702.5);
    drawLine0025.width = 32;
    drawLine0025.color = line0002.color;
    [haul0022.drawPrimitives addObject:drawLine0025];

    // Добавляем станцию Cedar Grove
    MWStation *station0024 = [[MWStation alloc] init];
    station0024.identifier = @"station0024";
    [edge0007.elements addObject:station0024];
    
    station0024.nameOriginal = @"Cedar Grove";
    station0024.geoLocation = CGPointMake(42.27969, -71.06039);
    station0024.mapLocation = CGPointMake(2300.5, 2702.5);

    MWDrawFillCircle *fillCircle0028 = [[MWDrawFillCircle alloc] init];
    fillCircle0028.center = station0024.mapLocation;
    fillCircle0028.radius = 9.5;
    fillCircle0028.fillColor = [UIColor whiteColor];
    [station0024.drawPrimitives addObject:fillCircle0028];

    MWDrawTextLine *drawTextLine0026 = [[MWDrawTextLine alloc] init];
    drawTextLine0026.text = station0024.nameOriginal;
    drawTextLine0026.fontName = @"Baskerville";
    drawTextLine0026.fontColor = [UIColor blackColor];
    drawTextLine0026.fontSize = 34;
    drawTextLine0026.origin = CGPointMake(2350, 2684);
    drawTextLine0026.kernSpacing = -2.2;
    [station0024.nameOriginalTextPrimitives addObject:drawTextLine0026];

    // Добавляем перегон
    MWHaul *haul0023 = [[MWHaul alloc] init];
    haul0023.identifier = @"haul0023";
    haul0023.length = 957;
    [edge0007.elements addObject:haul0023];

    MWDrawLine *drawLine0026 = [[MWDrawLine alloc] init];
    drawLine0026.startPoint = CGPointMake(2300.5, 2702);
    drawLine0026.endPoint = CGPointMake(2300.5, 2738);
    drawLine0026.width = 32;
    drawLine0026.color = line0001.color;
    [haul0023.drawPrimitives addObject:drawLine0026];
    
    MWDrawArc *drawArc0008 = [[MWDrawArc alloc] init];
    drawArc0008.center = CGPointMake(2270.5, 2738);
    drawArc0008.startRadians = 0 * M_PI / 180;
    drawArc0008.endRadians = 90 * M_PI / 180;
    drawArc0008.radius = 30;
    drawArc0008.width = 32;
    drawArc0008.color = line0002.color;
    [haul0023.drawPrimitives addObject:drawArc0008];

    // Добавляем станцию Butler
    MWStation *station0025 = [[MWStation alloc] init];
    station0025.identifier = @"station0025";
    [edge0007.elements addObject:station0025];
    
    station0025.nameOriginal = @"Butler";
    station0025.geoLocation = CGPointMake(42.272253, -71.062453);
    station0025.mapLocation = CGPointMake(2270, 2768);

    MWDrawFillCircle *fillCircle0029 = [[MWDrawFillCircle alloc] init];
    fillCircle0029.center = station0025.mapLocation;
    fillCircle0029.radius = 9.5;
    fillCircle0029.fillColor = [UIColor whiteColor];
    [station0025.drawPrimitives addObject:fillCircle0029];

    MWDrawTextLine *drawTextLine0027 = [[MWDrawTextLine alloc] init];
    drawTextLine0027.text = station0025.nameOriginal;
    drawTextLine0027.fontName = @"Baskerville";
    drawTextLine0027.fontColor = [UIColor blackColor];
    drawTextLine0027.fontSize = 34;
    drawTextLine0027.origin = CGPointMake(2162, 2863);
    drawTextLine0027.radians = - 45 * M_PI / 180;
    drawTextLine0027.kernSpacing = -1.6;
    [station0025.nameOriginalTextPrimitives addObject:drawTextLine0027];

    // Добавляем перегон
    MWHaul *haul0024 = [[MWHaul alloc] init];
    haul0024.identifier = @"haul0024";
    haul0024.length = 474;
    [edge0007.elements addObject:haul0024];

    MWDrawLine *drawLine0027 = [[MWDrawLine alloc] init];
    drawLine0027.startPoint = CGPointMake(2271, 2768);
    drawLine0027.endPoint = CGPointMake(2199, 2768);
    drawLine0027.width = 32;
    drawLine0027.color = line0002.color;
    [haul0024.drawPrimitives addObject:drawLine0027];

    // Добавляем станцию Milton
    MWStation *station0026 = [[MWStation alloc] init];
    station0026.identifier = @"station0026";
    [edge0007.elements addObject:station0026];
    
    station0026.nameOriginal = @"Milton";
    station0026.geoLocation = CGPointMake(42.270092, -71.067611);
    station0026.mapLocation = CGPointMake(2199, 2768);
    
    MWDrawFillCircle *fillCircle0030 = [[MWDrawFillCircle alloc] init];
    fillCircle0030.center = station0026.mapLocation;
    fillCircle0030.radius = 9.5;
    fillCircle0030.fillColor = [UIColor whiteColor];
    [station0026.drawPrimitives addObject:fillCircle0030];

    MWDrawTextLine *drawTextLine0028 = [[MWDrawTextLine alloc] init];
    drawTextLine0028.text = station0026.nameOriginal;
    drawTextLine0028.fontName = @"Baskerville";
    drawTextLine0028.fontColor = [UIColor blackColor];
    drawTextLine0028.fontSize = 34;
    drawTextLine0028.origin = CGPointMake(2089, 2863);
    drawTextLine0028.radians = - 45 * M_PI / 180;
    drawTextLine0028.kernSpacing = -2.0;
    [station0026.nameOriginalTextPrimitives addObject:drawTextLine0028];

    // Добавляем перегон
    MWHaul *haul0025 = [[MWHaul alloc] init];
    haul0025.identifier = @"haul0025";
    haul0025.length = 481;
    [edge0007.elements addObject:haul0025];

    MWDrawLine *drawLine0028 = [[MWDrawLine alloc] init];
    drawLine0028.startPoint = CGPointMake(2199.5, 2768);
    drawLine0028.endPoint = CGPointMake(2128, 2768);
    drawLine0028.width = 32;
    drawLine0028.color = line0002.color;
    [haul0025.drawPrimitives addObject:drawLine0028];

    // Добавляем станцию Central Ave
    MWStation *station0027 = [[MWStation alloc] init];
    station0027.identifier = @"station0027";
    [edge0007.elements addObject:station0027];
    
    station0027.nameOriginal = @"Central Avenue";
    station0027.geoLocation = CGPointMake(42.269965, -71.073249);
    station0027.mapLocation = CGPointMake(2128, 2768);

    MWDrawFillCircle *fillCircle0031 = [[MWDrawFillCircle alloc] init];
    fillCircle0031.center = station0027.mapLocation;
    fillCircle0031.radius = 9.5;
    fillCircle0031.fillColor = [UIColor whiteColor];
    [station0027.drawPrimitives addObject:fillCircle0031];

    MWDrawTextLine *drawTextLine0029 = [[MWDrawTextLine alloc] init];
    drawTextLine0029.text = @"Central Ave";
    drawTextLine0029.fontName = @"Baskerville";
    drawTextLine0029.fontColor = [UIColor blackColor];
    drawTextLine0029.fontSize = 34;
    drawTextLine0029.origin = CGPointMake(1965, 2914);
    drawTextLine0029.radians = - 45 * M_PI / 180;
    drawTextLine0029.kernSpacing = -1.8;
    [station0027.nameOriginalTextPrimitives addObject:drawTextLine0029];

    // Добавляем перегон
    MWHaul *haul0026 = [[MWHaul alloc] init];
    haul0026.identifier = @"haul0026";
    haul0026.length = 851;
    [edge0007.elements addObject:haul0026];

    MWDrawLine *drawLine0029 = [[MWDrawLine alloc] init];
    drawLine0029.startPoint = CGPointMake(2128.5, 2768);
    drawLine0029.endPoint = CGPointMake(2057, 2768);
    drawLine0029.width = 32;
    drawLine0029.color = line0002.color;
    [haul0026.drawPrimitives addObject:drawLine0029];

    // Добавляем станцию Valley Rd
    MWStation *station0028 = [[MWStation alloc] init];
    station0028.identifier = @"station0028";
    [edge0007.elements addObject:station0028];
    
    station0028.nameOriginal = @"Valley Road";
    station0028.geoLocation = CGPointMake(42.267772, -71.083025);
    station0028.mapLocation = CGPointMake(2057, 2768);

    MWDrawFillCircle *fillCircle0032 = [[MWDrawFillCircle alloc] init];
    fillCircle0032.center = station0028.mapLocation;
    fillCircle0032.radius = 9.5;
    fillCircle0032.fillColor = [UIColor whiteColor];
    [station0028.drawPrimitives addObject:fillCircle0032];
    
    MWDrawTextLine *drawTextLine0030 = [[MWDrawTextLine alloc] init];
    drawTextLine0030.text = @"Valley Rd";
    drawTextLine0030.fontName = @"Baskerville";
    drawTextLine0030.fontColor = [UIColor blackColor];
    drawTextLine0030.fontSize = 34;
    drawTextLine0030.origin = CGPointMake(1930, 2880);
    drawTextLine0030.radians = - 45 * M_PI / 180;
    drawTextLine0030.kernSpacing = -1.4;
    [station0028.nameOriginalTextPrimitives addObject:drawTextLine0030];

    // Добавляем перегон
    MWHaul *haul0027 = [[MWHaul alloc] init];
    haul0027.identifier = @"haul0027";
    haul0027.length = 366;
    [edge0007.elements addObject:haul0027];

    MWDrawLine *drawLine0030 = [[MWDrawLine alloc] init];
    drawLine0030.startPoint = CGPointMake(2057.5, 2768);
    drawLine0030.endPoint = CGPointMake(1986.5, 2768);
    drawLine0030.width = 32;
    drawLine0030.color = line0002.color;
    [haul0027.drawPrimitives addObject:drawLine0030];

    // Добавляем станцию Capen St
    MWStation *station0029 = [[MWStation alloc] init];
    station0029.identifier = @"station0029";
    [edge0007.elements addObject:station0029];
    
    station0029.nameOriginal = @"Capen Street";
    station0029.geoLocation = CGPointMake(42.267622, -71.087436);
    station0029.mapLocation = CGPointMake(1986.5, 2768.5);

    MWDrawFillCircle *fillCircle0033 = [[MWDrawFillCircle alloc] init];
    fillCircle0033.center = station0029.mapLocation;
    fillCircle0033.radius = 9.5;
    fillCircle0033.fillColor = [UIColor whiteColor];
    [station0029.drawPrimitives addObject:fillCircle0033];

    MWDrawTextLine *drawTextLine0031 = [[MWDrawTextLine alloc] init];
    drawTextLine0031.text = @"Capen St";
    drawTextLine0031.fontName = @"Baskerville";
    drawTextLine0031.fontColor = [UIColor blackColor];
    drawTextLine0031.fontSize = 34;
    drawTextLine0031.origin = CGPointMake(1842, 2895);
    drawTextLine0031.radians = - 45 * M_PI / 180;
    drawTextLine0031.kernSpacing = -2.0;
    [station0029.nameOriginalTextPrimitives addObject:drawTextLine0031];

    // Добавляем перегон
    MWHaul *haul0028 = [[MWHaul alloc] init];
    haul0028.identifier = @"haul0028";
    haul0028.length = 474;
    [edge0007.elements addObject:haul0028];

    MWDrawLine *drawLine0031 = [[MWDrawLine alloc] init];
    drawLine0031.startPoint = CGPointMake(1987, 2768);
    drawLine0031.endPoint = CGPointMake(1915, 2768.5);
    drawLine0031.width = 32;
    drawLine0031.color = line0002.color;
    [haul0028.drawPrimitives addObject:drawLine0031];

    // Добавляем станцию Mattapan
    MWStation *station0030 = [[MWStation alloc] init];
    station0030.identifier = @"station0030";
    [edge0007.elements addObject:station0030];
    
    station0030.nameOriginal = @"Mattapan";
    station0030.geoLocation = CGPointMake(42.2675, -71.093056);
    station0030.mapLocation = CGPointMake(1915, 2768.5);

    MWDrawFillCircle *fillCircle0034 = [[MWDrawFillCircle alloc] init];
    fillCircle0034.center = station0030.mapLocation;
    fillCircle0034.radius = 16;
    fillCircle0034.fillColor = line0002.color;
    [station0030.drawPrimitives addObject:fillCircle0034];

    MWDrawFillCircle *fillCircle0035 = [[MWDrawFillCircle alloc] init];
    fillCircle0035.center = station0030.mapLocation;
    fillCircle0035.radius = 9.5;
    fillCircle0035.fillColor = [UIColor whiteColor];
    [station0030.drawPrimitives addObject:fillCircle0035];

    MWDrawTextLine *drawTextLine0032 = [[MWDrawTextLine alloc] init];
    drawTextLine0032.text = @"MATTAPAN";
    drawTextLine0032.fontName = @"Baskerville";
    drawTextLine0032.fontColor = [UIColor blackColor];
    drawTextLine0032.fontSize = 36;
    drawTextLine0032.kernSpacing = -0.8;
    drawTextLine0032.degrees = -45;
    drawTextLine0032.origin = CGPointMake(1724, 2928);
    [station0030.nameOriginalTextPrimitives addObject:drawTextLine0032];

    // Добавляем вершину
    edge0007.finishVertex = vertex0008;

    ////////////////////////////////////////////////////////////////
    // 3. Orange Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Forest Hills - Tufts Medical Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0008 = [[MWEdge alloc] init];
    edge0008.identifier = @"edge0008";
    edge0008.developmentName = @"Ребро: Forest Hills - Tufts Medical Center";
    [self.edges addObject:edge0008];
    
    // Добавляем линию
    edge0008.line = line0003;
    
    // Добавляем вершину
    edge0008.startVertex = vertex0009;

    // Добавляем станцию Forest Hills
    MWStation *station0031 = [[MWStation alloc] init];
    station0031.identifier = @"station0031";
    [edge0008.elements addObject:station0031];
    
    station0031.nameOriginal = @"Forest Hills";
    station0031.geoLocation = CGPointMake(42.2988, -71.1149);
    station0031.mapLocation = CGPointMake(1163, 2453.5);

    MWDrawFillCircle *fillCircle0036 = [[MWDrawFillCircle alloc] init];
    fillCircle0036.center = station0031.mapLocation;
    fillCircle0036.radius = 16;
    fillCircle0036.fillColor = line0003.color;
    [station0031.drawPrimitives addObject:fillCircle0036];

    MWDrawFillCircle *fillCircle0037 = [[MWDrawFillCircle alloc] init];
    fillCircle0037.center = station0031.mapLocation;
    fillCircle0037.radius = 9.5;
    fillCircle0037.fillColor = [UIColor whiteColor];
    [station0031.drawPrimitives addObject:fillCircle0037];

    MWDrawTextLine *drawTextLine0033 = [[MWDrawTextLine alloc] init];
    drawTextLine0033.text = @"FOREST HILLS";
    drawTextLine0033.fontName = @"Baskerville";
    drawTextLine0033.fontColor = [UIColor blackColor];
    drawTextLine0033.fontSize = 36;
    drawTextLine0033.kernSpacing = -1.0;
    drawTextLine0033.origin = CGPointMake(1227, 2438);
    [station0031.nameOriginalTextPrimitives addObject:drawTextLine0033];

    // Добавляем перегон
    MWHaul *haul0029 = [[MWHaul alloc] init];
    haul0029.identifier = @"haul0029";
    haul0029.length = 1395;
    [edge0008.elements addObject:haul0029];

    MWDrawLine *drawLine0032 = [[MWDrawLine alloc] init];
    drawLine0032.startPoint = CGPointMake(1163, 2453.5);
    drawLine0032.endPoint = CGPointMake(1267.5, 2348);
    drawLine0032.width = 32;
    drawLine0032.color = line0003.color;
    [haul0029.drawPrimitives addObject:drawLine0032];

    // Добавляем станцию Green St
    MWStation *station0032 = [[MWStation alloc] init];
    station0032.identifier = @"station0032";
    [edge0008.elements addObject:station0032];
    
    station0032.nameOriginal = @"Green Street";
    station0032.geoLocation = CGPointMake(42.3102, -71.1078);
    station0032.mapLocation = CGPointMake(1267.5, 2348);

    MWDrawFillCircle *fillCircle0038 = [[MWDrawFillCircle alloc] init];
    fillCircle0038.center = station0032.mapLocation;
    fillCircle0038.radius = 9.5;
    fillCircle0038.fillColor = [UIColor whiteColor];
    [station0032.drawPrimitives addObject:fillCircle0038];

    MWDrawTextLine *drawTextLine0034 = [[MWDrawTextLine alloc] init];
    drawTextLine0034.text = @"Green St";
    drawTextLine0034.fontName = @"Baskerville";
    drawTextLine0034.fontColor = [UIColor blackColor];
    drawTextLine0034.fontSize = 34;
    drawTextLine0034.origin = CGPointMake(1332, 2333);
    drawTextLine0034.kernSpacing = -2.1;
    [station0032.nameOriginalTextPrimitives addObject:drawTextLine0034];

    // Добавляем перегон
    MWHaul *haul0030 = [[MWHaul alloc] init];
    haul0030.identifier = @"haul0030";
    haul0030.length = 835;
    [edge0008.elements addObject:haul0030];

    MWDrawLine *drawLine0033 = [[MWDrawLine alloc] init];
    drawLine0033.startPoint = CGPointMake(1267, 2348.5);
    drawLine0033.endPoint = CGPointMake(1372.5, 2243.5);
    drawLine0033.width = 32;
    drawLine0033.color = line0003.color;
    [haul0030.drawPrimitives addObject:drawLine0033];

    // Добавляем станцию Stony Brook
    MWStation *station0033 = [[MWStation alloc] init];
    station0033.identifier = @"station0033";
    [edge0008.elements addObject:station0033];
    
    station0033.nameOriginal = @"Stony Brook";
    station0033.geoLocation = CGPointMake(42.3172, -71.1043);
    station0033.mapLocation = CGPointMake(1372.5, 2243.5);

    MWDrawFillCircle *fillCircle0039 = [[MWDrawFillCircle alloc] init];
    fillCircle0039.center = station0033.mapLocation;
    fillCircle0039.radius = 9.5;
    fillCircle0039.fillColor = [UIColor whiteColor];
    [station0033.drawPrimitives addObject:fillCircle0039];

    MWDrawTextLine *drawTextLine0035 = [[MWDrawTextLine alloc] init];
    drawTextLine0035.text = station0033.nameOriginal;
    drawTextLine0035.fontName = @"Baskerville";
    drawTextLine0035.fontColor = [UIColor blackColor];
    drawTextLine0035.fontSize = 34;
    drawTextLine0035.origin = CGPointMake(1439, 2226);
    drawTextLine0035.kernSpacing = -1.7;
    [station0033.nameOriginalTextPrimitives addObject:drawTextLine0035];

    // Добавляем перегон
    MWHaul *haul0031 = [[MWHaul alloc] init];
    haul0031.identifier = @"haul0031";
    haul0031.length = 727;
    [edge0008.elements addObject:haul0031];

    MWDrawLine *drawLine0034 = [[MWDrawLine alloc] init];
    drawLine0034.startPoint = CGPointMake(1372, 2244);
    drawLine0034.endPoint = CGPointMake(1477.5, 2138.5);
    drawLine0034.width = 32;
    drawLine0034.color = line0003.color;
    [haul0031.drawPrimitives addObject:drawLine0034];

    // Добавляем станцию Jackson Sq
    MWStation *station0034 = [[MWStation alloc] init];
    station0034.identifier = @"station0034";
    [edge0008.elements addObject:station0034];
    
    station0034.nameOriginal = @"Jackson Square";
    station0034.geoLocation = CGPointMake(42.3229, -71.1);
    station0034.mapLocation = CGPointMake(1477.5, 2138.5);

    MWDrawFillCircle *fillCircle0040 = [[MWDrawFillCircle alloc] init];
    fillCircle0040.center = station0034.mapLocation;
    fillCircle0040.radius = 9.5;
    fillCircle0040.fillColor = [UIColor whiteColor];
    [station0034.drawPrimitives addObject:fillCircle0040];

    MWDrawTextLine *drawTextLine0036 = [[MWDrawTextLine alloc] init];
    drawTextLine0036.text = @"Jackson Sq";
    drawTextLine0036.fontName = @"Baskerville";
    drawTextLine0036.fontColor = [UIColor blackColor];
    drawTextLine0036.fontSize = 34;
    drawTextLine0036.origin = CGPointMake(1551, 2141);
    drawTextLine0036.kernSpacing = -1.7;
    [station0034.nameOriginalTextPrimitives addObject:drawTextLine0036];

    // Добавляем перегон
    MWHaul *haul0032 = [[MWHaul alloc] init];
    haul0032.identifier = @"haul0032";
    haul0032.length = 1016;
    [edge0008.elements addObject:haul0032];

    MWDrawLine *drawLine0035 = [[MWDrawLine alloc] init];
    drawLine0035.startPoint = CGPointMake(1477, 2139);
    drawLine0035.endPoint = CGPointMake(1581.5, 2033.5);
    drawLine0035.width = 32;
    drawLine0035.color = line0003.color;
    [haul0032.drawPrimitives addObject:drawLine0035];

    // Добавляем станцию Roxbury Crossing
    MWStation *station0035 = [[MWStation alloc] init];
    station0035.identifier = @"station0035";
    [edge0008.elements addObject:station0035];
    
    station0035.nameOriginal = @"Roxbury Crossing";
    station0035.geoLocation = CGPointMake(42.3313, -71.0956);
    station0035.mapLocation = CGPointMake(1581.5, 2033);

    MWDrawFillCircle *fillCircle0041 = [[MWDrawFillCircle alloc] init];
    fillCircle0041.center = station0035.mapLocation;
    fillCircle0041.radius = 9.5;
    fillCircle0041.fillColor = [UIColor whiteColor];
    [station0035.drawPrimitives addObject:fillCircle0041];

    MWDrawTextLine *drawTextLine0037 = [[MWDrawTextLine alloc] init];
    drawTextLine0037.text = @"Roxbury";
    drawTextLine0037.fontName = @"Baskerville";
    drawTextLine0037.fontColor = [UIColor blackColor];
    drawTextLine0037.fontSize = 34;
    drawTextLine0037.origin = CGPointMake(1644, 2020);
    drawTextLine0037.kernSpacing = -2.2;
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0037];

    MWDrawTextLine *drawTextLine0038 = [[MWDrawTextLine alloc] init];
    drawTextLine0038.text = @"Crossing";
    drawTextLine0038.fontName = @"Baskerville";
    drawTextLine0038.fontColor = [UIColor blackColor];
    drawTextLine0038.fontSize = 34;
    drawTextLine0038.origin = CGPointMake(1644, 2050);
    drawTextLine0038.kernSpacing = -1.4;
    [station0035.nameOriginalTextPrimitives addObject:drawTextLine0038];

    // Добавляем перегон
    MWHaul *haul0033 = [[MWHaul alloc] init];
    haul0033.identifier = @"haul0033";
    haul0033.length = 740;
    [edge0008.elements addObject:haul0033];

    MWDrawLine *drawLine0036 = [[MWDrawLine alloc] init];
    drawLine0036.startPoint = CGPointMake(1581, 2034);
    drawLine0036.endPoint = CGPointMake(1665, 1951);
    drawLine0036.width = 32;
    drawLine0036.color = line0003.color;
    [haul0033.drawPrimitives addObject:drawLine0036];

    // Добавляем станцию Ruggles
    MWStation *station0036 = [[MWStation alloc] init];
    station0036.identifier = @"station0036";
    [edge0008.elements addObject:station0036];
    
    station0036.nameOriginal = @"Ruggles";
    station0036.geoLocation = CGPointMake(42.3362, -71.0895);
    station0036.mapLocation = CGPointMake(1665, 1951);

    MWDrawFillCircle *fillCircle0042 = [[MWDrawFillCircle alloc] init];
    fillCircle0042.center = station0036.mapLocation;
    fillCircle0042.radius = 9.5;
    fillCircle0042.fillColor = [UIColor whiteColor];
    [station0036.drawPrimitives addObject:fillCircle0042];

    MWDrawTextLine *drawTextLine0039 = [[MWDrawTextLine alloc] init];
    drawTextLine0039.text = station0036.nameOriginal;
    drawTextLine0039.fontName = @"Baskerville";
    drawTextLine0039.fontColor = [UIColor blackColor];
    drawTextLine0039.fontSize = 34;
    drawTextLine0039.origin = CGPointMake(1724, 1937);
    drawTextLine0039.kernSpacing = -2.0;
    [station0036.nameOriginalTextPrimitives addObject:drawTextLine0039];
    
    // Добавляем перегон
    MWHaul *haul0034 = [[MWHaul alloc] init];
    haul0034.identifier = @"haul0034";
    haul0034.length = 786;
    [edge0008.elements addObject:haul0034];

    MWDrawLine *drawLine0037 = [[MWDrawLine alloc] init];
    drawLine0037.startPoint = CGPointMake(1664.5, 1951.5);
    drawLine0037.endPoint = CGPointMake(1748.5, 1867);
    drawLine0037.width = 32;
    drawLine0037.color = line0003.color;
    [haul0034.drawPrimitives addObject:drawLine0037];

    // Добавляем станцию Mass. Ave
    MWStation *station0037 = [[MWStation alloc] init];
    station0037.identifier = @"station0037";
    [edge0008.elements addObject:station0037];
    
    station0037.nameOriginal = @"Massachusetts Avenue";
    station0037.geoLocation = CGPointMake(42.3416, -71.0833);
    station0037.mapLocation = CGPointMake(1748.5, 1867);

    MWDrawFillCircle *fillCircle0043 = [[MWDrawFillCircle alloc] init];
    fillCircle0043.center = station0037.mapLocation;
    fillCircle0043.radius = 9.5;
    fillCircle0043.fillColor = [UIColor whiteColor];
    [station0037.drawPrimitives addObject:fillCircle0043];

    MWDrawTextLine *drawTextLine0040 = [[MWDrawTextLine alloc] init];
    drawTextLine0040.text = @"Mass. Ave";
    drawTextLine0040.fontName = @"Baskerville";
    drawTextLine0040.fontColor = [UIColor blackColor];
    drawTextLine0040.fontSize = 34;
    drawTextLine0040.origin = CGPointMake(1544, 1840);
    drawTextLine0040.kernSpacing = -1.2;
    [station0037.nameOriginalTextPrimitives addObject:drawTextLine0040];

    // Добавляем перегон
    MWHaul *haul0035 = [[MWHaul alloc] init];
    haul0035.identifier = @"haul0035";
    haul0035.length = 917;
    [edge0008.elements addObject:haul0035];

    MWDrawLine *drawLine0038 = [[MWDrawLine alloc] init];
    drawLine0038.startPoint = CGPointMake(1748, 1867.5);
    drawLine0038.endPoint = CGPointMake(1827, 1789);
    drawLine0038.width = 32;
    drawLine0038.color = line0003.color;
    [haul0035.drawPrimitives addObject:drawLine0038];

    // Добавляем станцию Back Bay
    MWStation *station0038 = [[MWStation alloc] init];
    station0038.identifier = @"station0038";
    [edge0008.elements addObject:station0038];
    
    station0038.nameOriginal = @"Back Bay";
    station0038.geoLocation = CGPointMake(42.3473, -71.0755);
    station0038.mapLocation = CGPointMake(1827, 1789);

    MWDrawFillCircle *fillCircle0044 = [[MWDrawFillCircle alloc] init];
    fillCircle0044.center = station0038.mapLocation;
    fillCircle0044.radius = 9.5;
    fillCircle0044.fillColor = [UIColor whiteColor];
    [station0038.drawPrimitives addObject:fillCircle0044];

    MWDrawTextLine *drawTextLine0041 = [[MWDrawTextLine alloc] init];
    drawTextLine0041.text = station0038.nameOriginal;
    drawTextLine0041.fontName = @"Baskerville";
    drawTextLine0041.fontColor = [UIColor blackColor];
    drawTextLine0041.fontSize = 34;
    drawTextLine0041.origin = CGPointMake(1637, 1759);
    drawTextLine0041.kernSpacing = -1.2 ;
    [station0038.nameOriginalTextPrimitives addObject:drawTextLine0041];

    // Добавляем перегон
    MWHaul *haul0036 = [[MWHaul alloc] init];
    haul0036.identifier = @"haul0036";
    haul0036.length = 964;
    [edge0008.elements addObject:haul0036];

    MWDrawLine *drawLine0039 = [[MWDrawLine alloc] init];
    drawLine0039.startPoint = CGPointMake(1826.5, 1789.5);
    drawLine0039.endPoint = CGPointMake(1915, 1701);
    drawLine0039.width = 32;
    drawLine0039.color = line0003.color;
    [haul0036.drawPrimitives addObject:drawLine0039];

    // Добавляем станцию Tufts Medical Center
    MWStation *station0039 = [[MWStation alloc] init];
    station0039.identifier = @"station0039";
    [edge0008.elements addObject:station0039];
    
    station0039.nameOriginal = @"Tufts Medical Center";
    station0039.geoLocation = CGPointMake(42.3486, -71.0645);
    station0039.mapLocation = CGPointMake(1915, 1701);

    MWDrawFillCircle *fillCircle0045 = [[MWDrawFillCircle alloc] init];
    fillCircle0045.center = station0039.mapLocation;
    fillCircle0045.radius = 9.5;
    fillCircle0045.fillColor = [UIColor whiteColor];
    [station0039.drawPrimitives addObject:fillCircle0045];

    MWDrawTextLine *drawTextLine0042 = [[MWDrawTextLine alloc] init];
    drawTextLine0042.text = @"Tufts";
    drawTextLine0042.fontName = @"Baskerville";
    drawTextLine0042.fontColor = [UIColor blackColor];
    drawTextLine0042.fontSize = 34;
    drawTextLine0042.origin = CGPointMake(1800, 1593);
    drawTextLine0042.kernSpacing = -1.2 ;
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0042];

    MWDrawTextLine *drawTextLine0043 = [[MWDrawTextLine alloc] init];
    drawTextLine0043.text = @"Medical";
    drawTextLine0043.fontName = @"Baskerville";
    drawTextLine0043.fontColor = [UIColor blackColor];
    drawTextLine0043.fontSize = 34;
    drawTextLine0043.origin = CGPointMake(1764, 1625);
    drawTextLine0043.kernSpacing = -2.0;
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0043];

    MWDrawTextLine *drawTextLine0044 = [[MWDrawTextLine alloc] init];
    drawTextLine0044.text = @"Center";
    drawTextLine0044.fontName = @"Baskerville";
    drawTextLine0044.fontColor = [UIColor blackColor];
    drawTextLine0044.fontSize = 34;
    drawTextLine0044.origin = CGPointMake(1776, 1659);
    drawTextLine0044.kernSpacing = -2.4;
    [station0039.nameOriginalTextPrimitives addObject:drawTextLine0044];

    // Добавляем вершину
    edge0008.finishVertex = vertex0010;

    // Создаем участок линии Tufts Medical Center - Chinatown
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0009 = [[MWEdge alloc] init];
    edge0009.identifier = @"edge0009";
    edge0009.developmentName = @"Ребро: Tufts Medical Center - Chinatown";
    [self.edges addObject:edge0009];
    
    // Добавляем линию
    edge0009.line = line0003;
    
    // Добавляем вершину
    edge0009.startVertex = vertex0010;

    // Добавляем станцию Tufts Medical Center
    [edge0009.elements addObject:station0039];

    // Добавляем перегон
    MWHaul *haul0037 = [[MWHaul alloc] init];
    haul0037.identifier = @"haul0037";
    haul0037.length = 434;
    [edge0009.elements addObject:haul0037];

    MWDrawLine *drawLine0040 = [[MWDrawLine alloc] init];
    drawLine0040.startPoint = CGPointMake(1914.5, 1701.5);
    drawLine0040.endPoint = CGPointMake(2066.5, 1549);
    drawLine0040.width = 32;
    drawLine0040.color = line0003.color;
    [haul0037.drawPrimitives addObject:drawLine0040];

    // Добавляем станцию Chinatown
    MWStation *station0040 = [[MWStation alloc] init];
    station0040.identifier = @"station0040";
    [edge0009.elements addObject:station0040];
    
    station0040.nameOriginal = @"Chinatown";
    station0040.geoLocation = CGPointMake(42.3522, -71.0627);
    station0040.mapLocation = CGPointMake(2066.5, 1549);

    MWDrawFillCircle *fillCircle0046 = [[MWDrawFillCircle alloc] init];
    fillCircle0046.center = station0040.mapLocation;
    fillCircle0046.radius = 9.5;
    fillCircle0046.fillColor = [UIColor whiteColor];
    [station0040.drawPrimitives addObject:fillCircle0046];

    MWDrawTextLine *drawTextLine0045 = [[MWDrawTextLine alloc] init];
    drawTextLine0045.text = station0040.nameOriginal;
    drawTextLine0045.fontName = @"Baskerville";
    drawTextLine0045.fontColor = [UIColor blackColor];
    drawTextLine0045.fontSize = 34;
    drawTextLine0045.origin = CGPointMake(2097, 1559);
    drawTextLine0045.kernSpacing = -2.4;
    [station0040.nameOriginalTextPrimitives addObject:drawTextLine0045];

    // Добавляем вершину
    edge0009.finishVertex = vertex0011;

    // Создаем участок линии Chinatown - Downtown Crossing
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0010 = [[MWEdge alloc] init];
    edge0010.identifier = @"edge0010";
    edge0010.developmentName = @"Ребро: Chinatown - Downtown Crossing";
    [self.edges addObject:edge0010];
    
    // Добавляем линию
    edge0010.line = line0003;
    
    // Добавляем вершину
    edge0010.startVertex = vertex0011;

    // Добавляем станцию Chinatown
    [edge0010.elements addObject:station0040];

    // Добавляем перегон
    MWHaul *haul0038 = [[MWHaul alloc] init];
    haul0038.identifier = @"haul0038";
    haul0038.length = 421;
    [edge0010.elements addObject:haul0038];
    
    MWDrawLine *drawLine0041 = [[MWDrawLine alloc] init];
    drawLine0041.startPoint = CGPointMake(2066, 1549.5);
    drawLine0041.endPoint = CGPointMake(2202.5, 1412);
    drawLine0041.width = 32;
    drawLine0041.color = line0003.color;
    [haul0038.drawPrimitives addObject:drawLine0041];

    // Добавляем станцию Downtown Crossing
    MWStation *station0041 = [[MWStation alloc] init];
    station0041.identifier = @"station0041";
    [edge0010.elements addObject:station0041];
    
    station0041.nameOriginal = @"Downtown Crossing";
    station0041.geoLocation = CGPointMake(42.3555, -71.0605);
    station0041.mapLocation = CGPointMake(2202.5, 1412);
    
    MWDrawFillCircle *fillCircle0047 = [[MWDrawFillCircle alloc] init];
    fillCircle0047.center = station0041.mapLocation;
    fillCircle0047.radius = 9.5;
    fillCircle0047.fillColor = [UIColor whiteColor];
    [station0041.drawPrimitives addObject:fillCircle0047];

    station0041.showNameOnMap = NO;
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0010];
    [station0041.nameOriginalTextPrimitives addObject:drawTextLine0010];
    
    // Добавляем вершину
    edge0010.finishVertex = vertex0003;

    // Создаем участок линии Downtown Crossing - State
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0011 = [[MWEdge alloc] init];
    edge0011.identifier = @"edge0011";
    edge0011.developmentName = @"Ребро: Downtown Crossing - State";
    [self.edges addObject:edge0011];
    
    // Добавляем линию
    edge0011.line = line0003;
    
    // Добавляем вершину
    edge0011.startVertex = vertex0003;

    // Добавляем станцию Downtown Crossing
    [edge0011.elements addObject:station0041];

    // Добавляем перегон
    MWHaul *haul0039 = [[MWHaul alloc] init];
    haul0039.identifier = @"haul0039";
    haul0039.length = 436;
    [edge0011.elements addObject:haul0039];

    MWDrawLine *drawLine0042 = [[MWDrawLine alloc] init];
    drawLine0042.startPoint = CGPointMake(2202, 1412.5);
    drawLine0042.endPoint = CGPointMake(2245.5, 1371.5);
    drawLine0042.width = 32;
    drawLine0042.color = line0003.color;
    [haul0039.drawPrimitives addObject:drawLine0042];

    MWDrawArc *drawArc0009 = [[MWDrawArc alloc] init];
    drawArc0009.center = CGPointMake(2190, 1314);
    drawArc0009.startRadians = 0 * M_PI / 180;
    drawArc0009.endRadians = 46.5 * M_PI / 180;
    drawArc0009.radius = 80;
    drawArc0009.width = 32;
    drawArc0009.color = line0003.color;
    [haul0039.drawPrimitives addObject:drawArc0009];

    MWDrawLine *drawLine0043 = [[MWDrawLine alloc] init];
    drawLine0043.startPoint = CGPointMake(2270, 1314);
    drawLine0043.endPoint = CGPointMake(2270, 1258);
    drawLine0043.width = 32;
    drawLine0043.color = line0003.color;
    [haul0039.drawPrimitives addObject:drawLine0043];

    // Добавляем станцию State
    MWStation *station0042 = [[MWStation alloc] init];
    station0042.identifier = @"station0042";
    [edge0011.elements addObject:station0042];
    
    station0042.nameOriginal = @"State";
    station0042.geoLocation = CGPointMake(42.3587, -71.0578);
    station0042.mapLocation = CGPointMake(2270, 1258);
    
    MWDrawFillCircle *fillCircle0048 = [[MWDrawFillCircle alloc] init];
    fillCircle0048.center = station0042.mapLocation;
    fillCircle0048.radius = 9.5;
    fillCircle0048.fillColor = [UIColor whiteColor];
    [station0042.drawPrimitives addObject:fillCircle0048];

    MWDrawTextLine *drawTextLine0046 = [[MWDrawTextLine alloc] init];
    drawTextLine0046.text = station0042.nameOriginal;
    drawTextLine0046.fontName = @"Baskerville";
    drawTextLine0046.fontColor = [UIColor blackColor];
    drawTextLine0046.fontSize = 34;
    drawTextLine0046.origin = CGPointMake(2319, 1265);
    drawTextLine0046.kernSpacing = -1.9;
    [station0042.nameOriginalTextPrimitives addObject:drawTextLine0046];

    // Добавляем вершину
    edge0011.finishVertex = vertex0012;

    // Создаем участок линии State - Haymarket
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0012 = [[MWEdge alloc] init];
    edge0012.identifier = @"edge0012";
    edge0012.developmentName = @"Ребро: State - Haymarket";
    [self.edges addObject:edge0012];
    
    // Добавляем линию
    edge0012.line = line0003;
    
    // Добавляем вершину
    edge0012.startVertex = vertex0012;

    // Добавляем станцию State
    [edge0012.elements addObject:station0042];

    // Добавляем перегон
    MWHaul *haul0040 = [[MWHaul alloc] init];
    haul0040.identifier = @"haul0040";
    haul0040.length = 514;
    [edge0012.elements addObject:haul0040];

    MWDrawLine *drawLine0044 = [[MWDrawLine alloc] init];
    drawLine0044.startPoint = CGPointMake(2270, 1258.5);
    drawLine0044.endPoint = CGPointMake(2269.5, 1071);
    drawLine0044.width = 32;
    drawLine0044.color = line0003.color;
    [haul0040.drawPrimitives addObject:drawLine0044];

    // Добавляем станцию Haymarket
    MWStation *station0043 = [[MWStation alloc] init];
    station0043.identifier = @"station0043";
    [edge0012.elements addObject:station0043];
    
    station0043.nameOriginal = @"Haymarket";
    station0043.geoLocation = CGPointMake(42.3633, -71.0582);
    station0043.mapLocation = CGPointMake(2269.5, 1071);

    MWDrawFillCircle *fillCircle0049 = [[MWDrawFillCircle alloc] init];
    fillCircle0049.center = station0043.mapLocation;
    fillCircle0049.radius = 9.5;
    fillCircle0049.fillColor = [UIColor whiteColor];
    [station0043.drawPrimitives addObject:fillCircle0049];

    MWDrawLine *drawLine0056 = [[MWDrawLine alloc] init];
    drawLine0056.startPoint = CGPointMake(2320, 1100);
    drawLine0056.endPoint = CGPointMake(2450, 1100);
    drawLine0056.width = 32;
    drawLine0056.color = [UIColor colorWithRed:(255/255.0) green:(255/255.0) blue:(255/255.0) alpha:0.5];
    [station0043.drawPrimitives addObject:drawLine0056];

    MWDrawTextLine *drawTextLine0047 = [[MWDrawTextLine alloc] init];
    drawTextLine0047.text = station0043.nameOriginal;
    drawTextLine0047.fontName = @"Baskerville";
    drawTextLine0047.fontColor = [UIColor blackColor];
    drawTextLine0047.fontSize = 34;
    drawTextLine0047.origin = CGPointMake(2316, 1078);
    drawTextLine0047.kernSpacing = -2.8;
    [station0043.nameOriginalTextPrimitives addObject:drawTextLine0047];

    // Добавляем вершину
    edge0012.finishVertex = vertex0013;

    // Создаем участок линии Haymarket - North Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0013 = [[MWEdge alloc] init];
    edge0013.identifier = @"edge0013";
    edge0013.developmentName = @"Ребро: Haymarket - North Station";
    [self.edges addObject:edge0013];
    
    // Добавляем линию
    edge0013.line = line0003;
    
    // Добавляем вершину
    edge0013.startVertex = vertex0013;

    // Добавляем станцию Haymarket
    [edge0013.elements addObject:station0043];

    // Добавляем перегон
    MWHaul *haul0041 = [[MWHaul alloc] init];
    haul0041.identifier = @"haul0041";
    haul0041.length = 351;
    [edge0013.elements addObject:haul0041];

    MWDrawLine *drawLine0045 = [[MWDrawLine alloc] init];
    drawLine0045.startPoint = CGPointMake(2269.5, 1071.5);
    drawLine0045.endPoint = CGPointMake(2269.5, 906.5);
    drawLine0045.width = 32;
    drawLine0045.color = line0003.color;
    [haul0041.drawPrimitives addObject:drawLine0045];
    
    // Добавляем станцию North Station
    MWStation *station0044 = [[MWStation alloc] init];
    station0044.identifier = @"station0044";
    [edge0013.elements addObject:station0044];
    
    station0044.nameOriginal = @"North Station";
    station0044.geoLocation = CGPointMake(42.3657, -71.061);
    station0044.mapLocation = CGPointMake(2269.5, 906.5);

    MWDrawFillCircle *fillCircle0050 = [[MWDrawFillCircle alloc] init];
    fillCircle0050.center = station0044.mapLocation;
    fillCircle0050.radius = 9.5;
    fillCircle0050.fillColor = [UIColor whiteColor];
    [station0044.drawPrimitives addObject:fillCircle0050];

    MWDrawTextLine *drawTextLine0048 = [[MWDrawTextLine alloc] init];
    drawTextLine0048.text = station0044.nameOriginal;
    drawTextLine0048.fontName = @"Baskerville";
    drawTextLine0048.fontColor = [UIColor blackColor];
    drawTextLine0048.fontSize = 34;
    drawTextLine0048.origin = CGPointMake(2042, 905);
    drawTextLine0048.kernSpacing = -2.0;
    [station0044.nameOriginalTextPrimitives addObject:drawTextLine0048];

    // Добавляем вершину
    edge0013.finishVertex = vertex0014;

    // Создаем участок линии North Station - Oak Grove
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0014 = [[MWEdge alloc] init];
    edge0014.identifier = @"edge0014";
    edge0014.developmentName = @"Ребро: North Station - Oak Grove";
    [self.edges addObject:edge0014];
    
    // Добавляем линию
    edge0014.line = line0003;
    
    // Добавляем вершину
    edge0014.startVertex = vertex0014;

    // Добавляем станцию North Station
    [edge0014.elements addObject:station0044];

    // Добавляем перегон
    MWHaul *haul0042 = [[MWHaul alloc] init];
    haul0042.identifier = @"haul0042";
    haul0042.length = 1194;
    [edge0014.elements addObject:haul0042];

    MWDrawLine *drawLine0046 = [[MWDrawLine alloc] init];
    drawLine0046.startPoint = CGPointMake(2269.5, 907);
    drawLine0046.endPoint = CGPointMake(2270, 691);
    drawLine0046.width = 32;
    drawLine0046.color = line0003.color;
    [haul0042.drawPrimitives addObject:drawLine0046];

    // Добавляем станцию Community College
    MWStation *station0045 = [[MWStation alloc] init];
    station0045.identifier = @"station0045";
    [edge0014.elements addObject:station0045];
    
    station0045.nameOriginal = @"Community College";
    station0045.geoLocation = CGPointMake(42.3737, -71.0702);
    station0045.mapLocation = CGPointMake(2270, 691);

    MWDrawFillCircle *fillCircle0051 = [[MWDrawFillCircle alloc] init];
    fillCircle0051.center = station0045.mapLocation;
    fillCircle0051.radius = 9.5;
    fillCircle0051.fillColor = [UIColor whiteColor];
    [station0045.drawPrimitives addObject:fillCircle0051];

    MWDrawTextLine *drawTextLine0049 = [[MWDrawTextLine alloc] init];
    drawTextLine0049.text = @"Community";
    drawTextLine0049.fontName = @"Baskerville";
    drawTextLine0049.fontColor = [UIColor blackColor];
    drawTextLine0049.fontSize = 34;
    drawTextLine0049.origin = CGPointMake(2067, 640.5);
    drawTextLine0049.kernSpacing = -2.6;
    [station0045.nameOriginalTextPrimitives addObject:drawTextLine0049];

    MWDrawTextLine *drawTextLine0050 = [[MWDrawTextLine alloc] init];
    drawTextLine0050.text = @"College";
    drawTextLine0050.fontName = @"Baskerville";
    drawTextLine0050.fontColor = [UIColor blackColor];
    drawTextLine0050.fontSize = 34;
    drawTextLine0050.origin = CGPointMake(2117, 670);
    drawTextLine0050.kernSpacing = -1.4;
    [station0045.nameOriginalTextPrimitives addObject:drawTextLine0050];

    // Добавляем перегон
    MWHaul *haul0043 = [[MWHaul alloc] init];
    haul0043.identifier = @"haul0043";
    haul0043.length = 1372;
    [edge0014.elements addObject:haul0043];

    MWDrawLine *drawLine0047 = [[MWDrawLine alloc] init];
    drawLine0047.startPoint = CGPointMake(2270, 691.5);
    drawLine0047.endPoint = CGPointMake(2270, 601.5);
    drawLine0047.width = 32;
    drawLine0047.color = line0003.color;
    [haul0043.drawPrimitives addObject:drawLine0047];

    // Добавляем станцию Sullivan Sq
    MWStation *station0046 = [[MWStation alloc] init];
    station0046.identifier = @"station0046";
    [edge0014.elements addObject:station0046];
    
    station0046.nameOriginal = @"Sullivan Square";
    station0046.geoLocation = CGPointMake(42.384031, -71.07697);
    station0046.mapLocation = CGPointMake(2270, 601.5);

    MWDrawFillCircle *fillCircle0052 = [[MWDrawFillCircle alloc] init];
    fillCircle0052.center = station0046.mapLocation;
    fillCircle0052.radius = 9.5;
    fillCircle0052.fillColor = [UIColor whiteColor];
    [station0046.drawPrimitives addObject:fillCircle0052];

    MWDrawTextLine *drawTextLine0051 = [[MWDrawTextLine alloc] init];
    drawTextLine0051.text = @"Sullivan Sq";
    drawTextLine0051.fontName = @"Baskerville";
    drawTextLine0051.fontColor = [UIColor blackColor];
    drawTextLine0051.fontSize = 34;
    drawTextLine0051.origin = CGPointMake(2069, 581);
    drawTextLine0051.kernSpacing = -0.8;
    [station0046.nameOriginalTextPrimitives addObject:drawTextLine0051];

    // Добавляем перегон
    MWHaul *haul0044 = [[MWHaul alloc] init];
    haul0044.identifier = @"haul0044";
    haul0044.length = 926;
    [edge0014.elements addObject:haul0044];

    MWDrawLine *drawLine0048 = [[MWDrawLine alloc] init];
    drawLine0048.startPoint = CGPointMake(2270, 602);
    drawLine0048.endPoint = CGPointMake(2270, 512);
    drawLine0048.width = 32;
    drawLine0048.color = line0003.color;
    [haul0044.drawPrimitives addObject:drawLine0048];

    // Добавляем станцию Assembly
    MWStation *station0047 = [[MWStation alloc] init];
    station0047.identifier = @"station0047";
    [edge0014.elements addObject:station0047];
    
    station0047.nameOriginal = @"Assembly";
    station0047.geoLocation = CGPointMake(42.392356, -71.077333);
    station0047.mapLocation = CGPointMake(2269.5, 512);

    MWDrawFillCircle *fillCircle0053 = [[MWDrawFillCircle alloc] init];
    fillCircle0053.center = station0047.mapLocation;
    fillCircle0053.radius = 9.5;
    fillCircle0053.fillColor = [UIColor whiteColor];
    [station0047.drawPrimitives addObject:fillCircle0053];

    MWDrawTextLine *drawTextLine0052 = [[MWDrawTextLine alloc] init];
    drawTextLine0052.text = station0047.nameOriginal;
    drawTextLine0052.fontName = @"Baskerville";
    drawTextLine0052.fontColor = [UIColor blackColor];
    drawTextLine0052.fontSize = 34;
    drawTextLine0052.origin = CGPointMake(2089, 490);
    drawTextLine0052.kernSpacing = -1.2;
    [station0047.nameOriginalTextPrimitives addObject:drawTextLine0052];

    // Добавляем перегон
    MWHaul *haul0045 = [[MWHaul alloc] init];
    haul0045.identifier = @"haul0045";
    haul0045.length = 1064;
    [edge0014.elements addObject:haul0045];

    MWDrawLine *drawLine0049 = [[MWDrawLine alloc] init];
    drawLine0049.startPoint = CGPointMake(2270, 512.5);
    drawLine0049.endPoint = CGPointMake(2269.5, 422.5);
    drawLine0049.width = 32;
    drawLine0049.color = line0003.color;
    [haul0045.drawPrimitives addObject:drawLine0049];

    // Добавляем станцию Wellington
    MWStation *station0048 = [[MWStation alloc] init];
    station0048.identifier = @"station0048";
    [edge0014.elements addObject:station0048];
    
    station0048.nameOriginal = @"Wellington";
    station0048.geoLocation = CGPointMake(42.401907, -71.077096);
    station0048.mapLocation = CGPointMake(2269.5, 422.5);

    MWDrawFillCircle *fillCircle0054 = [[MWDrawFillCircle alloc] init];
    fillCircle0054.center = station0048.mapLocation;
    fillCircle0054.radius = 9.5;
    fillCircle0054.fillColor = [UIColor whiteColor];
    [station0048.drawPrimitives addObject:fillCircle0054];

    MWDrawTextLine *drawTextLine0053 = [[MWDrawTextLine alloc] init];
    drawTextLine0053.text = station0048.nameOriginal;
    drawTextLine0053.fontName = @"Baskerville";
    drawTextLine0053.fontColor = [UIColor blackColor];
    drawTextLine0053.fontSize = 34;
    drawTextLine0053.origin = CGPointMake(2080, 402);
    drawTextLine0053.kernSpacing = -1.4;
    [station0048.nameOriginalTextPrimitives addObject:drawTextLine0053];

    // Добавляем перегон
    MWHaul *haul0046 = [[MWHaul alloc] init];
    haul0046.identifier = @"haul0046";
    haul0046.length = 2786;
    [edge0014.elements addObject:haul0046];

    MWDrawLine *drawLine0050 = [[MWDrawLine alloc] init];
    drawLine0050.startPoint = CGPointMake(2269.5, 423);
    drawLine0050.endPoint = CGPointMake(2269.5, 333);
    drawLine0050.width = 32;
    drawLine0050.color = line0003.color;
    [haul0046.drawPrimitives addObject:drawLine0050];

    // Добавляем станцию Malden Center
    MWStation *station0049 = [[MWStation alloc] init];
    station0049.identifier = @"station0049";
    [edge0014.elements addObject:station0049];
    
    station0049.nameOriginal = @"Malden Center";
    station0049.geoLocation = CGPointMake(42.426715, -71.074349);
    station0049.mapLocation = CGPointMake(2269.5, 333);
    
    MWDrawFillCircle *fillCircle0055 = [[MWDrawFillCircle alloc] init];
    fillCircle0055.center = station0049.mapLocation;
    fillCircle0055.radius = 9.5;
    fillCircle0055.fillColor = [UIColor whiteColor];
    [station0049.drawPrimitives addObject:fillCircle0055];

    MWDrawTextLine *drawTextLine0054 = [[MWDrawTextLine alloc] init];
    drawTextLine0054.text = station0049.nameOriginal;
    drawTextLine0054.fontName = @"Baskerville";
    drawTextLine0054.fontColor = [UIColor blackColor];
    drawTextLine0054.fontSize = 34;
    drawTextLine0054.origin = CGPointMake(2022, 313);
    drawTextLine0054.kernSpacing = -2.4;
    [station0049.nameOriginalTextPrimitives addObject:drawTextLine0054];

    // Добавляем перегон
    MWHaul *haul0047 = [[MWHaul alloc] init];
    haul0047.identifier = @"haul0047";
    haul0047.length = 1174;
    [edge0014.elements addObject:haul0047];

    MWDrawLine *drawLine0051 = [[MWDrawLine alloc] init];
    drawLine0051.startPoint = CGPointMake(2269.5, 333.5);
    drawLine0051.endPoint = CGPointMake(2269.5, 243.5);
    drawLine0051.width = 32;
    drawLine0051.color = line0003.color;
    [haul0047.drawPrimitives addObject:drawLine0051];

    // Добавляем станцию Oak Grove
    MWStation *station0050 = [[MWStation alloc] init];
    station0050.identifier = @"station0050";
    [edge0014.elements addObject:station0050];
    
    station0050.nameOriginal = @"Oak Grove";
    station0050.geoLocation = CGPointMake(42.436942, -71.070889);
    station0050.mapLocation = CGPointMake(2269.5, 243.5);

    MWDrawFillCircle *fillCircle0056 = [[MWDrawFillCircle alloc] init];
    fillCircle0056.center = station0050.mapLocation;
    fillCircle0056.radius = 16;
    fillCircle0056.fillColor = line0003.color;
    [station0050.drawPrimitives addObject:fillCircle0056];
    
    MWDrawFillCircle *fillCircle0057 = [[MWDrawFillCircle alloc] init];
    fillCircle0057.center = station0050.mapLocation;
    fillCircle0057.radius = 9.5;
    fillCircle0057.fillColor = [UIColor whiteColor];
    [station0050.drawPrimitives addObject:fillCircle0057];
    
    MWDrawTextLine *drawTextLine0055 = [[MWDrawTextLine alloc] init];
    drawTextLine0055.text = @"OAK GROVE";
    drawTextLine0055.fontName = @"Baskerville";
    drawTextLine0055.fontColor = [UIColor blackColor];
    drawTextLine0055.fontSize = 36;
    drawTextLine0055.origin = CGPointMake(2003, 221);
    drawTextLine0055.kernSpacing = -1.0;
    [station0050.nameOriginalTextPrimitives addObject:drawTextLine0055];

    // Добавляем вершину
    edge0014.finishVertex = vertex0015;

    ////////////////////////////////////////////////////////////////
    // 4. Blue Line
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Bowdoin - Government Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0015 = [[MWEdge alloc] init];
    edge0015.identifier = @"edge0015";
    edge0015.developmentName = @"Ребро: Bowdoin - Government Center";
    [self.edges addObject:edge0015];
    
    // Добавляем линию
    edge0015.line = line0004;
    
    // Добавляем вершину
    edge0015.startVertex = vertex0016;

    // Добавляем станцию Bowdoin
    MWStation *station0051 = [[MWStation alloc] init];
    station0051.identifier = @"station0051";
    [edge0015.elements addObject:station0051];
    
    station0051.nameOriginal = @"Bowdoin";
    station0051.geoLocation = CGPointMake(42.3614, -71.0622);
    station0051.mapLocation = CGPointMake(2073, 1078.5);

    MWDrawFillCircle *fillCircle0058 = [[MWDrawFillCircle alloc] init];
    fillCircle0058.center = station0051.mapLocation;
    fillCircle0058.radius = 16;
    fillCircle0058.fillColor = line0004.color;
    [station0051.drawPrimitives addObject:fillCircle0058];

    MWDrawFillCircle *fillCircle0059 = [[MWDrawFillCircle alloc] init];
    fillCircle0059.center = station0051.mapLocation;
    fillCircle0059.radius = 9.5;
    fillCircle0059.fillColor = [UIColor whiteColor];
    [station0051.drawPrimitives addObject:fillCircle0059];
    
    MWDrawTextLine *drawTextLine0056 = [[MWDrawTextLine alloc] init];
    drawTextLine0056.text = @"BOWDOIN";
    drawTextLine0056.fontName = @"Baskerville";
    drawTextLine0056.fontColor = [UIColor blackColor];
    drawTextLine0056.fontSize = 36;
    drawTextLine0056.origin = CGPointMake(1900, 1013);
    drawTextLine0056.kernSpacing = -1.4;
    [station0051.nameOriginalTextPrimitives addObject:drawTextLine0056];

    // Добавляем перегон
    MWHaul *haul0048 = [[MWHaul alloc] init];
    haul0048.identifier = @"haul0048";
    haul0048.length = 329;
    [edge0015.elements addObject:haul0048];

    MWDrawLine *drawLine0052 = [[MWDrawLine alloc] init];
    drawLine0052.startPoint = CGPointMake(2073, 1078.5);
    drawLine0052.endPoint = CGPointMake(2167.5, 1172.5);
    drawLine0052.width = 32;
    drawLine0052.color = line0004.color;
    [haul0048.drawPrimitives addObject:drawLine0052];

    // Добавляем станцию Government Center
    MWStation *station0052 = [[MWStation alloc] init];
    station0052.identifier = @"station0052";
    [edge0015.elements addObject:station0052];
    
    station0052.nameOriginal = @"Government Center";
    station0052.geoLocation = CGPointMake(42.359444, -71.059444);
    station0052.mapLocation = CGPointMake(2167.5, 1172.5);

    MWDrawFillCircle *fillCircle0060 = [[MWDrawFillCircle alloc] init];
    fillCircle0060.center = station0052.mapLocation;
    fillCircle0060.radius = 5;
    fillCircle0060.fillColor = [UIColor whiteColor];
    [station0052.drawPrimitives addObject:fillCircle0060];

    MWDrawTextLine *drawTextLine0057 = [[MWDrawTextLine alloc] init];
    drawTextLine0057.text = @"Gov't. Ctr";
    drawTextLine0057.fontName = @"Baskerville";
    drawTextLine0057.fontColor = [UIColor blackColor];
    drawTextLine0057.fontSize = 34;
    drawTextLine0057.origin = CGPointMake(1980, 1129.5);
    drawTextLine0057.kernSpacing = - 1.0;
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0057];

    MWDrawTextLine *drawTextLine0058 = [[MWDrawTextLine alloc] init];
    drawTextLine0058.text = @"Closed for";
    drawTextLine0058.fontName = @"Baskerville";
    drawTextLine0058.fontColor = [UIColor blackColor];
    drawTextLine0058.fontSize = 19;
    drawTextLine0058.origin = CGPointMake(2020, 1162);
    drawTextLine0058.kernSpacing = - 0.2;
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0058];

    MWDrawTextLine *drawTextLine0059 = [[MWDrawTextLine alloc] init];
    drawTextLine0059.text = @"renovation";
    drawTextLine0059.fontName = @"Baskerville";
    drawTextLine0059.fontColor = [UIColor blackColor];
    drawTextLine0059.fontSize = 19;
    drawTextLine0059.origin = CGPointMake(2020, 1180);
    drawTextLine0059.kernSpacing = - 0.6;
    [station0052.nameOriginalTextPrimitives addObject:drawTextLine0059];

    // Добавляем вершину
    edge0015.finishVertex = vertex0017;

    // Создаем участок линии Government Center - State
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0016 = [[MWEdge alloc] init];
    edge0016.identifier = @"edge0016";
    edge0016.developmentName = @"Ребро: Government Center - State";
    [self.edges addObject:edge0016];
    
    // Добавляем линию
    edge0016.line = line0004;
    
    // Добавляем вершину
    edge0016.startVertex = vertex0017;

    // Добавляем станцию Government Center
    [edge0016.elements addObject:station0052];

    // Добавляем перегон
    MWHaul *haul0049 = [[MWHaul alloc] init];
    haul0049.identifier = @"haul0049";
    haul0049.length = 163;
    [edge0016.elements addObject:haul0049];

    MWDrawLine *drawLine0053 = [[MWDrawLine alloc] init];
    drawLine0053.startPoint = CGPointMake(2167, 1172);
    drawLine0053.endPoint = CGPointMake(2242.5, 1248);
    drawLine0053.width = 32;
    drawLine0053.color = line0004.color;
    [haul0049.drawPrimitives addObject:drawLine0053];

    MWDrawArc *drawArc0010 = [[MWDrawArc alloc] init];
    drawArc0010.center = CGPointMake(2270, 1219);
    drawArc0010.startRadians = 89.5 * M_PI / 180;
    drawArc0010.endRadians = 135 * M_PI / 180;
    drawArc0010.radius = 40;
    drawArc0010.width = 32;
    drawArc0010.color = line0004.color;
    [haul0049.drawPrimitives addObject:drawArc0010];

    // Добавляем станцию State
    MWStation *station0053 = [[MWStation alloc] init];
    station0053.identifier = @"station0053";
    [edge0016.elements addObject:station0053];
    
    station0053.nameOriginal = @"State";
    station0053.geoLocation = CGPointMake(42.3587, -71.0578);
    station0053.mapLocation = CGPointMake(2270, 1258);
    
    MWDrawFillCircle *fillCircle0061 = [[MWDrawFillCircle alloc] init];
    fillCircle0061.center = station0053.mapLocation;
    fillCircle0061.radius = 9.5;
    fillCircle0061.fillColor = [UIColor whiteColor];
    [station0053.drawPrimitives addObject:fillCircle0061];

    station0053.showNameOnMap = NO;
    [station0053.nameOriginalTextPrimitives addObject:drawTextLine0046];
    
    // Добавляем вершину
    edge0016.finishVertex = vertex0012;

    // Создаем участок линии Government State - Wonderland
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0017 = [[MWEdge alloc] init];
    edge0017.identifier = @"edge0017";
    edge0017.developmentName = @"Ребро: Government State - Wonderland";
    [self.edges addObject:edge0017];
    
    // Добавляем линию
    edge0017.line = line0004;
    
    // Добавляем вершину
    edge0017.startVertex = vertex0012;

    // Добавляем станцию State
    [edge0017.elements addObject:station0053];

    // Добавляем перегон
    MWHaul *haul0050 = [[MWHaul alloc] init];
    haul0050.identifier = @"haul0050";
    haul0050.length = 397;
    [edge0017.elements addObject:haul0050];

    MWDrawArc *drawArc0011 = [[MWDrawArc alloc] init];
    drawArc0011.center = CGPointMake(2270, 1219);
    drawArc0011.startRadians = 45 * M_PI / 180;
    drawArc0011.endRadians = 90 * M_PI / 180;
    drawArc0011.radius = 40;
    drawArc0011.width = 32;
    drawArc0011.color = line0004.color;
    [haul0050.drawPrimitives addObject:drawArc0011];

    MWDrawLine *drawLine0054 = [[MWDrawLine alloc] init];
    drawLine0054.startPoint = CGPointMake(2297.5, 1248);
    drawLine0054.endPoint = CGPointMake(2395, 1149.5);
    drawLine0054.width = 32;
    drawLine0054.color = line0004.color;
    [haul0050.drawPrimitives addObject:drawLine0054];

    // Добавляем станцию Aquarium
    MWStation *station0054 = [[MWStation alloc] init];
    station0054.identifier = @"station0054";
    [edge0017.elements addObject:station0054];
    
    station0054.nameOriginal = @"Aquarium";
    station0054.geoLocation = CGPointMake(42.3593, -71.0531);
    station0054.mapLocation = CGPointMake(2395, 1149.5);

    MWDrawFillCircle *fillCircle0062 = [[MWDrawFillCircle alloc] init];
    fillCircle0062.center = station0054.mapLocation;
    fillCircle0062.radius = 9.5;
    fillCircle0062.fillColor = [UIColor whiteColor];
    [station0054.drawPrimitives addObject:fillCircle0062];

    MWDrawTextLine *drawTextLine0060 = [[MWDrawTextLine alloc] init];
    drawTextLine0060.text = station0054.nameOriginal;
    drawTextLine0060.fontName = @"Baskerville";
    drawTextLine0060.fontColor = [UIColor blackColor];
    drawTextLine0060.fontSize = 34;
    drawTextLine0060.origin = CGPointMake(2457, 1138);
    drawTextLine0060.kernSpacing = - 2.6;
    [station0054.nameOriginalTextPrimitives addObject:drawTextLine0060];
    
    // Добавляем перегон
    MWHaul *haul0051 = [[MWHaul alloc] init];
    haul0051.identifier = @"haul0051";
    haul0051.length = 1666;
    [edge0017.elements addObject:haul0051];
    
    MWDrawLine *drawLine0055 = [[MWDrawLine alloc] init];
    drawLine0055.startPoint = CGPointMake(2394.5, 1150);
    drawLine0055.endPoint = CGPointMake(2585, 961);
    drawLine0055.width = 32;
    drawLine0055.color = line0004.color;
    [haul0051.drawPrimitives addObject:drawLine0055];

    // Добавляем станцию Maverick
    MWStation *station0055 = [[MWStation alloc] init];
    station0055.identifier = @"station0055";
    [edge0017.elements addObject:station0055];
    
    station0055.nameOriginal = @"Maverick";
    station0055.geoLocation = CGPointMake(42.3691, -71.0395);
    station0055.mapLocation = CGPointMake(2585, 961);
    
    MWDrawFillCircle *fillCircle0063 = [[MWDrawFillCircle alloc] init];
    fillCircle0063.center = station0055.mapLocation;
    fillCircle0063.radius = 9.5;
    fillCircle0063.fillColor = [UIColor whiteColor];
    [station0055.drawPrimitives addObject:fillCircle0063];

    MWDrawTextLine *drawTextLine0061 = [[MWDrawTextLine alloc] init];
    drawTextLine0061.text = station0055.nameOriginal;
    drawTextLine0061.fontName = @"Baskerville";
    drawTextLine0061.fontColor = [UIColor blackColor];
    drawTextLine0061.fontSize = 34;
    drawTextLine0061.origin = CGPointMake(2586, 980);
    drawTextLine0061.kernSpacing = - 1.8;
    [station0055.nameOriginalTextPrimitives addObject:drawTextLine0061];

    // Добавляем перегон
    MWHaul *haul0052 = [[MWHaul alloc] init];
    haul0052.identifier = @"haul0052";
    haul0052.length = 991;
    [edge0017.elements addObject:haul0052];

    MWDrawLine *drawLine0057 = [[MWDrawLine alloc] init];
    drawLine0057.startPoint = CGPointMake(2584.5, 961.5);
    drawLine0057.endPoint = CGPointMake(2653.5, 891.5);
    drawLine0057.width = 32;
    drawLine0057.color = line0004.color;
    [haul0052.drawPrimitives addObject:drawLine0057];

    // Добавляем станцию Airport
    MWStation *station0056 = [[MWStation alloc] init];
    station0056.identifier = @"station0056";
    [edge0017.elements addObject:station0056];
    
    station0056.nameOriginal = @"Airport";
    station0056.geoLocation = CGPointMake(42.374374, -71.030243);
    station0056.mapLocation = CGPointMake(2653.5, 891.5);

    MWDrawFillCircle *fillCircle0064 = [[MWDrawFillCircle alloc] init];
    fillCircle0064.center = station0056.mapLocation;
    fillCircle0064.radius = 9.5;
    fillCircle0064.fillColor = [UIColor whiteColor];
    [station0056.drawPrimitives addObject:fillCircle0064];

    MWDrawTextLine *drawTextLine0062 = [[MWDrawTextLine alloc] init];
    drawTextLine0062.text = station0056.nameOriginal;
    drawTextLine0062.fontName = @"Baskerville";
    drawTextLine0062.fontColor = [UIColor blackColor];
    drawTextLine0062.fontSize = 34;
    drawTextLine0062.origin = CGPointMake(2724, 868);
    drawTextLine0062.kernSpacing = - 2.0;
    [station0056.nameOriginalTextPrimitives addObject:drawTextLine0062];

    // Добавляем перегон
    MWHaul *haul0053 = [[MWHaul alloc] init];
    haul0053.identifier = @"haul0053";
    haul0053.length = 846;
    [edge0017.elements addObject:haul0053];

    MWDrawLine *drawLine0058 = [[MWDrawLine alloc] init];
    drawLine0058.startPoint = CGPointMake(2653, 892);
    drawLine0058.endPoint = CGPointMake(2724.5, 820.5);
    drawLine0058.width = 32;
    drawLine0058.color = line0004.color;
    [haul0053.drawPrimitives addObject:drawLine0058];

    // Добавляем станцию Wood Island
    MWStation *station0057 = [[MWStation alloc] init];
    station0057.identifier = @"station0057";
    [edge0017.elements addObject:station0057];
    
    station0057.nameOriginal = @"Wood Island";
    station0057.geoLocation = CGPointMake(42.3797, -71.023);
    station0057.mapLocation = CGPointMake(2724.5, 820.5);

    MWDrawFillCircle *fillCircle0065 = [[MWDrawFillCircle alloc] init];
    fillCircle0065.center = station0057.mapLocation;
    fillCircle0065.radius = 9.5;
    fillCircle0065.fillColor = [UIColor whiteColor];
    [station0057.drawPrimitives addObject:fillCircle0065];

    MWDrawTextLine *drawTextLine0063 = [[MWDrawTextLine alloc] init];
    drawTextLine0063.text = station0057.nameOriginal;
    drawTextLine0063.fontName = @"Baskerville";
    drawTextLine0063.fontColor = [UIColor blackColor];
    drawTextLine0063.fontSize = 34;
    drawTextLine0063.origin = CGPointMake(2787, 814);
    drawTextLine0063.kernSpacing = - 1.8;
    [station0057.nameOriginalTextPrimitives addObject:drawTextLine0063];

    // Добавляем перегон
    MWHaul *haul0054 = [[MWHaul alloc] init];
    haul0054.identifier = @"haul0054";
    haul0054.length = 1812;
    [edge0017.elements addObject:haul0054];

    MWDrawLine *drawLine0059 = [[MWDrawLine alloc] init];
    drawLine0059.startPoint = CGPointMake(2724, 821);
    drawLine0059.endPoint = CGPointMake(2811.5, 733.5);
    drawLine0059.width = 32;
    drawLine0059.color = line0004.color;
    [haul0054.drawPrimitives addObject:drawLine0059];

    // Добавляем станцию Orient Heights
    MWStation *station0058 = [[MWStation alloc] init];
    station0058.identifier = @"station0058";
    [edge0017.elements addObject:station0058];
    
    station0058.nameOriginal = @"Orient Heights";
    station0058.geoLocation = CGPointMake(42.3871, -71.0042);
    station0058.mapLocation = CGPointMake(2811.5, 733.5);

    MWDrawFillCircle *fillCircle0066 = [[MWDrawFillCircle alloc] init];
    fillCircle0066.center = station0058.mapLocation;
    fillCircle0066.radius = 9.5;
    fillCircle0066.fillColor = [UIColor whiteColor];
    [station0058.drawPrimitives addObject:fillCircle0066];

    MWDrawTextLine *drawTextLine0064 = [[MWDrawTextLine alloc] init];
    drawTextLine0064.text = station0058.nameOriginal;
    drawTextLine0064.fontName = @"Baskerville";
    drawTextLine0064.fontColor = [UIColor blackColor];
    drawTextLine0064.fontSize = 34;
    drawTextLine0064.origin = CGPointMake(2871, 725);
    drawTextLine0064.kernSpacing = - 2.0;
    [station0058.nameOriginalTextPrimitives addObject:drawTextLine0064];

    // Добавляем перегон
    MWHaul *haul0055 = [[MWHaul alloc] init];
    haul0055.identifier = @"haul0055";
    haul0055.length = 702;
    [edge0017.elements addObject:haul0055];

    MWDrawLine *drawLine0060 = [[MWDrawLine alloc] init];
    drawLine0060.startPoint = CGPointMake(2811, 734);
    drawLine0060.endPoint = CGPointMake(2899, 646);
    drawLine0060.width = 32;
    drawLine0060.color = line0004.color;
    [haul0055.drawPrimitives addObject:drawLine0060];

    // Добавляем станцию Suffolk Downs
    MWStation *station0059 = [[MWStation alloc] init];
    station0059.identifier = @"station0059";
    [edge0017.elements addObject:station0059];
    
    station0059.nameOriginal = @"Suffolk Downs";
    station0059.geoLocation = CGPointMake(42.3904, -70.997);
    station0059.mapLocation = CGPointMake(2899, 646);

    MWDrawFillCircle *fillCircle0067 = [[MWDrawFillCircle alloc] init];
    fillCircle0067.center = station0059.mapLocation;
    fillCircle0067.radius = 9.5;
    fillCircle0067.fillColor = [UIColor whiteColor];
    [station0059.drawPrimitives addObject:fillCircle0067];

    MWDrawTextLine *drawTextLine0065 = [[MWDrawTextLine alloc] init];
    drawTextLine0065.text = station0059.nameOriginal;
    drawTextLine0065.fontName = @"Baskerville";
    drawTextLine0065.fontColor = [UIColor blackColor];
    drawTextLine0065.fontSize = 34;
    drawTextLine0065.origin = CGPointMake(2961, 637.5);
    drawTextLine0065.kernSpacing = - 1.4;
    [station0059.nameOriginalTextPrimitives addObject:drawTextLine0065];

    // Добавляем перегон
    MWHaul *haul0056 = [[MWHaul alloc] init];
    haul0056.identifier = @"haul0056";
    haul0056.length = 878;
    [edge0017.elements addObject:haul0056];

    MWDrawLine *drawLine0061 = [[MWDrawLine alloc] init];
    drawLine0061.startPoint = CGPointMake(2898.5, 646.5);
    drawLine0061.endPoint = CGPointMake(2986, 559);
    drawLine0061.width = 32;
    drawLine0061.color = line0004.color;
    [haul0056.drawPrimitives addObject:drawLine0061];

    // Добавляем станцию Beachmont
    MWStation *station0060 = [[MWStation alloc] init];
    station0060.identifier = @"station0060";
    [edge0017.elements addObject:station0060];
    
    station0060.nameOriginal = @"Beachmont";
    station0060.geoLocation = CGPointMake(42.3975, -70.9922);
    station0060.mapLocation = CGPointMake(2986, 559);

    MWDrawFillCircle *fillCircle0068 = [[MWDrawFillCircle alloc] init];
    fillCircle0068.center = station0060.mapLocation;
    fillCircle0068.radius = 9.5;
    fillCircle0068.fillColor = [UIColor whiteColor];
    [station0060.drawPrimitives addObject:fillCircle0068];

    MWDrawTextLine *drawTextLine0066 = [[MWDrawTextLine alloc] init];
    drawTextLine0066.text = station0060.nameOriginal;
    drawTextLine0066.fontName = @"Baskerville";
    drawTextLine0066.fontColor = [UIColor blackColor];
    drawTextLine0066.fontSize = 34;
    drawTextLine0066.origin = CGPointMake(3043, 551.5);
    drawTextLine0066.kernSpacing = - 2.0;
    [station0060.nameOriginalTextPrimitives addObject:drawTextLine0066];

    // Добавляем перегон
    MWHaul *haul0057 = [[MWHaul alloc] init];
    haul0057.identifier = @"haul0057";
    haul0057.length = 1158;
    [edge0017.elements addObject:haul0057];

    MWDrawLine *drawLine0062 = [[MWDrawLine alloc] init];
    drawLine0062.startPoint = CGPointMake(2985.5, 559.5);
    drawLine0062.endPoint = CGPointMake(3071.5, 474);
    drawLine0062.width = 32;
    drawLine0062.color = line0004.color;
    [haul0057.drawPrimitives addObject:drawLine0062];

    // Добавляем станцию Revere Beach
    MWStation *station0061 = [[MWStation alloc] init];
    station0061.identifier = @"station0061";
    [edge0017.elements addObject:station0061];
    
    station0061.nameOriginal = @"Revere Beach";
    station0061.geoLocation = CGPointMake(42.4078, -70.9926);
    station0061.mapLocation = CGPointMake(3071.5, 474);

    MWDrawFillCircle *fillCircle0069 = [[MWDrawFillCircle alloc] init];
    fillCircle0069.center = station0061.mapLocation;
    fillCircle0069.radius = 9.5;
    fillCircle0069.fillColor = [UIColor whiteColor];
    [station0061.drawPrimitives addObject:fillCircle0069];

    MWDrawTextLine *drawTextLine0067 = [[MWDrawTextLine alloc] init];
    drawTextLine0067.text = @"Revere";
    drawTextLine0067.fontName = @"Baskerville";
    drawTextLine0067.fontColor = [UIColor blackColor];
    drawTextLine0067.fontSize = 34;
    drawTextLine0067.origin = CGPointMake(3129, 467);
    drawTextLine0067.kernSpacing = - 1.4;
    [station0061.nameOriginalTextPrimitives addObject:drawTextLine0067];

    MWDrawTextLine *drawTextLine0068 = [[MWDrawTextLine alloc] init];
    drawTextLine0068.text = @"Beach";
    drawTextLine0068.fontName = @"Baskerville";
    drawTextLine0068.fontColor = [UIColor blackColor];
    drawTextLine0068.fontSize = 34;
    drawTextLine0068.origin = CGPointMake(3129, 497);
    drawTextLine0068.kernSpacing = - 1.4;
    [station0061.nameOriginalTextPrimitives addObject:drawTextLine0068];

    // Добавляем перегон
    MWHaul *haul0058 = [[MWHaul alloc] init];
    haul0058.identifier = @"haul0058";
    haul0058.length = 638;
    [edge0017.elements addObject:haul0058];

    MWDrawLine *drawLine0063 = [[MWDrawLine alloc] init];
    drawLine0063.startPoint = CGPointMake(3071, 474.5);
    drawLine0063.endPoint = CGPointMake(3175.5, 370);
    drawLine0063.width = 32;
    drawLine0063.color = line0004.color;
    [haul0058.drawPrimitives addObject:drawLine0063];

    // Добавляем станцию Wonderland
    MWStation *station0062 = [[MWStation alloc] init];
    station0062.identifier = @"station0062";
    [edge0017.elements addObject:station0062];
    
    station0062.nameOriginal = @"Wonderland";
    station0062.geoLocation = CGPointMake(42.4135, -70.9918);
    station0062.mapLocation = CGPointMake(3175.5, 370);

    MWDrawFillCircle *fillCircle0070 = [[MWDrawFillCircle alloc] init];
    fillCircle0070.center = station0062.mapLocation;
    fillCircle0070.radius = 16;
    fillCircle0070.fillColor = line0004.color;
    [station0062.drawPrimitives addObject:fillCircle0070];
    
    MWDrawFillCircle *fillCircle0071 = [[MWDrawFillCircle alloc] init];
    fillCircle0071.center = station0062.mapLocation;
    fillCircle0071.radius = 9.5;
    fillCircle0071.fillColor = [UIColor whiteColor];
    [station0062.drawPrimitives addObject:fillCircle0071];
    
    MWDrawTextLine *drawTextLine0069 = [[MWDrawTextLine alloc] init];
    drawTextLine0069.text = @"WONDERLAND";
    drawTextLine0069.fontName = @"Baskerville";
    drawTextLine0069.fontColor = [UIColor blackColor];
    drawTextLine0069.fontSize = 36;
    drawTextLine0069.kernSpacing = - 1.0;
    drawTextLine0069.origin = CGPointMake(2818, 345);
    [station0062.nameOriginalTextPrimitives addObject:drawTextLine0069];

    // Добавляем вершину
    edge0017.finishVertex = vertex0018;

    ////////////////////////////////////////////////////////////////
    // 5. Silver Line SL1
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Terminal A - Silver Line Way
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0018 = [[MWEdge alloc] init];
    edge0018.identifier = @"edge0018";
    edge0018.developmentName = @"Ребро: Terminal A - Silver Line Way";
    [self.edges addObject:edge0018];
    
    // Добавляем линию
    edge0018.line = line0005;
    
    // Добавляем вершину
    edge0018.startVertex = vertex0019;
    
    // Добавляем станцию Terminal A
    MWStation *station0063 = [[MWStation alloc] init];
    station0063.identifier = @"station0063";
    [edge0018.elements addObject:station0063];
    
    station0063.nameOriginal = @"Logan Airport Term. A";
    edge0018.directionFromStation = station0063;
    station0063.geoLocation = CGPointMake(42.364665, -71.020897);
    station0063.mapLocation = CGPointMake(2861.5, 1164);
    
    MWDrawFillCircle *fillCircle0072 = [[MWDrawFillCircle alloc] init];
    fillCircle0072.center = station0063.mapLocation;
    fillCircle0072.radius = 9.5;
    fillCircle0072.fillColor = [UIColor whiteColor];
    [station0063.drawPrimitives addObject:fillCircle0072];

    MWDrawFillCircle *fillCircle0073 = [[MWDrawFillCircle alloc] init];
    fillCircle0073.center = CGPointMake(2822, 1184);
    fillCircle0073.radius = 3;
    fillCircle0073.fillColor = [UIColor colorWithRed:(0/255.0) green:(163/255.0) blue:(201/255.0) alpha:1];
    [station0063.drawPrimitives addObject:fillCircle0073];

    MWDrawFillCircle *fillCircle0074 = [[MWDrawFillCircle alloc] init];
    fillCircle0074.center = CGPointMake(2848, 1184);
    fillCircle0074.radius = 3;
    fillCircle0074.fillColor = [UIColor colorWithRed:(0/255.0) green:(163/255.0) blue:(201/255.0) alpha:1];
    [station0063.drawPrimitives addObject:fillCircle0074];

    MWDrawFillCircle *fillCircle0075 = [[MWDrawFillCircle alloc] init];
    fillCircle0075.center = CGPointMake(2848, 1214);
    fillCircle0075.radius = 3;
    fillCircle0075.fillColor = [UIColor colorWithRed:(0/255.0) green:(163/255.0) blue:(201/255.0) alpha:1];
    [station0063.drawPrimitives addObject:fillCircle0075];

    MWDrawFillCircle *fillCircle0076 = [[MWDrawFillCircle alloc] init];
    fillCircle0076.center = CGPointMake(2822, 1214);
    fillCircle0076.radius = 3;
    fillCircle0076.fillColor = [UIColor colorWithRed:(0/255.0) green:(163/255.0) blue:(201/255.0) alpha:1];
    [station0063.drawPrimitives addObject:fillCircle0076];

    MWDrawLine *drawLine0064 = [[MWDrawLine alloc] init];
    drawLine0064.startPoint = CGPointMake(2822, 1184);
    drawLine0064.endPoint = CGPointMake(2848, 1184);
    drawLine0064.width = 6;
    drawLine0064.color = [UIColor colorWithRed:(0/255.0) green:(163/255.0) blue:(201/255.0) alpha:1];
    [station0063.drawPrimitives addObject:drawLine0064];

    MWDrawLine *drawLine0065 = [[MWDrawLine alloc] init];
    drawLine0065.startPoint = CGPointMake(2848, 1184);
    drawLine0065.endPoint = CGPointMake(2848, 1214);
    drawLine0065.width = 6;
    drawLine0065.color = [UIColor colorWithRed:(0/255.0) green:(163/255.0) blue:(201/255.0) alpha:1];
    [station0063.drawPrimitives addObject:drawLine0065];

    MWDrawLine *drawLine0066 = [[MWDrawLine alloc] init];
    drawLine0066.startPoint = CGPointMake(2848, 1214);
    drawLine0066.endPoint = CGPointMake(2822, 1214);
    drawLine0066.width = 6;
    drawLine0066.color = [UIColor colorWithRed:(0/255.0) green:(163/255.0) blue:(201/255.0) alpha:1];
    [station0063.drawPrimitives addObject:drawLine0066];

    MWDrawLine *drawLine0067 = [[MWDrawLine alloc] init];
    drawLine0067.startPoint = CGPointMake(2822, 1214);
    drawLine0067.endPoint = CGPointMake(2822, 1184);
    drawLine0067.width = 6;
    drawLine0067.color = [UIColor colorWithRed:(0/255.0) green:(163/255.0) blue:(201/255.0) alpha:1];
    [station0063.drawPrimitives addObject:drawLine0067];

    MWDrawLine *drawLine0068 = [[MWDrawLine alloc] init];
    drawLine0068.startPoint = CGPointMake(2835, 1217);
    drawLine0068.endPoint = CGPointMake(2835, 1181);
    drawLine0068.width = 26;
    drawLine0068.color = [UIColor colorWithRed:(0/255.0) green:(163/255.0) blue:(201/255.0) alpha:1];
    [station0063.drawPrimitives addObject:drawLine0068];
    
    MWDrawTextLine *drawTextLine0070 = [[MWDrawTextLine alloc] init];
    drawTextLine0070.text = @"A";
    drawTextLine0070.fontName = @"Arial-BoldMT";
    drawTextLine0070.fontColor = [UIColor whiteColor];
    drawTextLine0070.fontSize = 36;
    drawTextLine0070.kernSpacing = - 1.0;
    drawTextLine0070.origin = CGPointMake(2822.5, 1179);
    [station0063.nameOriginalTextPrimitives addObject:drawTextLine0070];

    // Добавляем перегон
    MWHaul *haul0059 = [[MWHaul alloc] init];
    haul0059.identifier = @"haul0059";
    haul0059.length = 365;
    [edge0018.elements addObject:haul0059];

    MWDrawLine *drawLine0069 = [[MWDrawLine alloc] init];
    drawLine0069.startPoint = CGPointMake(2861.5, 1164);
    drawLine0069.endPoint = CGPointMake(2912.5, 1214.5);
    drawLine0069.width = 32;
    drawLine0069.color = line0005.color;
    [haul0059.drawPrimitives addObject:drawLine0069];

    MWDrawArc *drawArc0012 = [[MWDrawArc alloc] init];
    drawArc0012.center = CGPointMake(2936.5, 1189);
    drawArc0012.startRadians = 89.5 * M_PI / 180;
    drawArc0012.endRadians = 135 * M_PI / 180;
    drawArc0012.radius = 35;
    drawArc0012.width = 32;
    drawArc0012.color = line0005.color;
    [haul0059.drawPrimitives addObject:drawArc0012];

    // Добавляем станцию Terminal B West
    MWStation *station0064 = [[MWStation alloc] init];
    station0064.identifier = @"station0064";
    [edge0018.elements addObject:station0064];
    
    station0064.nameOriginal = @"Logan Airport Term. B West";
    station0064.geoLocation = CGPointMake(42.362156, -71.018856);
    station0064.mapLocation = CGPointMake(2936.5, 1222.5);

    MWDrawFillCircle *fillCircle0077 = [[MWDrawFillCircle alloc] init];
    fillCircle0077.center = station0064.mapLocation;
    fillCircle0077.radius = 9.5;
    fillCircle0077.fillColor = [UIColor whiteColor];
    [station0064.drawPrimitives addObject:fillCircle0077];

    MWDrawFillCircle *fillCircle0078 = [[MWDrawFillCircle alloc] init];
    fillCircle0078.center = CGPointMake(2972.5, 1233);
    fillCircle0078.radius = 3;
    fillCircle0078.fillColor = [UIColor colorWithRed:(237/255.0) green:(29/255.0) blue:(36/255.0) alpha:1];
    [station0064.drawPrimitives addObject:fillCircle0078];
    
    MWDrawFillCircle *fillCircle0079 = [[MWDrawFillCircle alloc] init];
    fillCircle0079.center = CGPointMake(2998.5, 1233);
    fillCircle0079.radius = 3;
    fillCircle0079.fillColor = [UIColor colorWithRed:(237/255.0) green:(29/255.0) blue:(36/255.0) alpha:1];
    [station0064.drawPrimitives addObject:fillCircle0079];
    
    MWDrawFillCircle *fillCircle0080 = [[MWDrawFillCircle alloc] init];
    fillCircle0080.center = CGPointMake(2998.5, 1263);
    fillCircle0080.radius = 3;
    fillCircle0080.fillColor = [UIColor colorWithRed:(237/255.0) green:(29/255.0) blue:(36/255.0) alpha:1];
    [station0064.drawPrimitives addObject:fillCircle0080];
    
    MWDrawFillCircle *fillCircle0081 = [[MWDrawFillCircle alloc] init];
    fillCircle0081.center = CGPointMake(2972.5, 1263);
    fillCircle0081.radius = 3;
    fillCircle0081.fillColor = [UIColor colorWithRed:(237/255.0) green:(29/255.0) blue:(36/255.0) alpha:1];
    [station0064.drawPrimitives addObject:fillCircle0081];

    MWDrawLine *drawLine0070 = [[MWDrawLine alloc] init];
    drawLine0070.startPoint = CGPointMake(2972.5, 1233);
    drawLine0070.endPoint = CGPointMake(2998.5, 1233);
    drawLine0070.width = 6;
    drawLine0070.color = [UIColor colorWithRed:(237/255.0) green:(29/255.0) blue:(36/255.0) alpha:1];
    [station0064.drawPrimitives addObject:drawLine0070];

    MWDrawLine *drawLine0071 = [[MWDrawLine alloc] init];
    drawLine0071.startPoint = CGPointMake(2998.5, 1233);
    drawLine0071.endPoint = CGPointMake(2998.5, 1263);
    drawLine0071.width = 6;
    drawLine0071.color = [UIColor colorWithRed:(237/255.0) green:(29/255.0) blue:(36/255.0) alpha:1];
    [station0064.drawPrimitives addObject:drawLine0071];

    MWDrawLine *drawLine0072 = [[MWDrawLine alloc] init];
    drawLine0072.startPoint = CGPointMake(2998.5, 1263);
    drawLine0072.endPoint = CGPointMake(2972.5, 1263);
    drawLine0072.width = 6;
    drawLine0072.color = [UIColor colorWithRed:(237/255.0) green:(29/255.0) blue:(36/255.0) alpha:1];
    [station0064.drawPrimitives addObject:drawLine0072];

    MWDrawLine *drawLine0073 = [[MWDrawLine alloc] init];
    drawLine0073.startPoint = CGPointMake(2972.5, 1263);
    drawLine0073.endPoint = CGPointMake(2972.5, 1233);
    drawLine0073.width = 6;
    drawLine0073.color = [UIColor colorWithRed:(237/255.0) green:(29/255.0) blue:(36/255.0) alpha:1];
    [station0064.drawPrimitives addObject:drawLine0073];

    MWDrawLine *drawLine0074 = [[MWDrawLine alloc] init];
    drawLine0074.startPoint = CGPointMake(2985.5, 1233);
    drawLine0074.endPoint = CGPointMake(2985.5, 1263);
    drawLine0074.width = 26;
    drawLine0074.color = [UIColor colorWithRed:(237/255.0) green:(29/255.0) blue:(36/255.0) alpha:1];
    [station0064.drawPrimitives addObject:drawLine0074];
    
    MWDrawTextLine *drawTextLine0071 = [[MWDrawTextLine alloc] init];
    drawTextLine0071.text = @"B";
    drawTextLine0071.fontName = @"Arial-BoldMT";
    drawTextLine0071.fontColor = [UIColor whiteColor];
    drawTextLine0071.fontSize = 36;
    drawTextLine0071.kernSpacing = - 1.0;
    drawTextLine0071.origin = CGPointMake(2973, 1228);
    [station0064.nameOriginalTextPrimitives addObject:drawTextLine0071];
    
    // Добавляем перегон
    MWHaul *haul0060 = [[MWHaul alloc] init];
    haul0060.identifier = @"haul0060";
    haul0060.length = 218;
    [edge0018.elements addObject:haul0060];

    MWDrawArc *drawArc0013 = [[MWDrawArc alloc] init];
    drawArc0013.center = CGPointMake(2936.5, 1189);
    drawArc0013.startRadians = 45 * M_PI / 180;
    drawArc0013.endRadians = 91 * M_PI / 180;
    drawArc0013.radius = 35;
    drawArc0013.width = 32;
    drawArc0013.color = line0005.color;
    [haul0060.drawPrimitives addObject:drawArc0013];

    MWDrawLine *drawLine0075 = [[MWDrawLine alloc] init];
    drawLine0075.startPoint = CGPointMake(2960.5, 1214.5);
    drawLine0075.endPoint = CGPointMake(2977.5, 1197.5);
    drawLine0075.width = 32;
    drawLine0075.color = line0005.color;
    [haul0060.drawPrimitives addObject:drawLine0075];

    // Добавляем станцию Terminal B East
    MWStation *station0065 = [[MWStation alloc] init];
    station0065.identifier = @"station0065";
    [edge0018.elements addObject:station0065];
    
    station0065.nameOriginal = @"Logan Airport Term. B East";
    station0065.geoLocation = CGPointMake(42.361708, -71.017863);
    station0065.mapLocation = CGPointMake(2977.5, 1197);

    MWDrawFillCircle *fillCircle0082 = [[MWDrawFillCircle alloc] init];
    fillCircle0082.center = station0065.mapLocation;
    fillCircle0082.radius = 9.5;
    fillCircle0082.fillColor = [UIColor whiteColor];
    [station0065.drawPrimitives addObject:fillCircle0082];

    station0065.showNameOnMap = NO;
    [station0065.drawPrimitives addObject:fillCircle0078];
    [station0065.drawPrimitives addObject:fillCircle0079];
    [station0065.drawPrimitives addObject:fillCircle0080];
    [station0065.drawPrimitives addObject:fillCircle0081];
    [station0065.drawPrimitives addObject:drawLine0070];
    [station0065.drawPrimitives addObject:drawLine0071];
    [station0065.drawPrimitives addObject:drawLine0072];
    [station0065.drawPrimitives addObject:drawLine0073];
    [station0065.drawPrimitives addObject:drawLine0074];
    [station0065.nameOriginalTextPrimitives addObject:drawTextLine0071];

    // Добавляем перегон
    MWHaul *haul0061 = [[MWHaul alloc] init];
    haul0061.identifier = @"haul0061";
    haul0061.length = 607;
    [edge0018.elements addObject:haul0061];

    MWDrawArc *drawArc0014 = [[MWDrawArc alloc] init];
    drawArc0014.center = CGPointMake(2952, 1173.5);
    drawArc0014.startRadians = 315 * M_PI / 180;
    drawArc0014.endRadians = 45 * M_PI / 180;
    drawArc0014.radius = 35;
    drawArc0014.width = 32;
    drawArc0014.color = line0005.color;
    [haul0061.drawPrimitives addObject:drawArc0014];

    MWDrawLine *drawLine0076 = [[MWDrawLine alloc] init];
    drawLine0076.startPoint = CGPointMake(2977.5, 1149.5);
    drawLine0076.endPoint = CGPointMake(2950, 1121.5);
    drawLine0076.width = 32;
    drawLine0076.color = line0005.color;
    [haul0061.drawPrimitives addObject:drawLine0076];

    // Добавляем станцию Terminal C
    MWStation *station0066 = [[MWStation alloc] init];
    station0066.identifier = @"station0066";
    [edge0018.elements addObject:station0066];
    
    station0066.nameOriginal = @"Logan Airport Term. C";
    station0066.geoLocation = CGPointMake(42.366651, -71.017160);
    station0066.mapLocation = CGPointMake(2950, 1121.5);

    MWDrawFillCircle *fillCircle0083 = [[MWDrawFillCircle alloc] init];
    fillCircle0083.center = station0066.mapLocation;
    fillCircle0083.radius = 9.5;
    fillCircle0083.fillColor = [UIColor whiteColor];
    [station0066.drawPrimitives addObject:fillCircle0083];

    MWDrawFillCircle *fillCircle0084 = [[MWDrawFillCircle alloc] init];
    fillCircle0084.center = CGPointMake(2970.5, 1079);
    fillCircle0084.radius = 3;
    fillCircle0084.fillColor = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(72/255.0) alpha:1];
    [station0066.drawPrimitives addObject:fillCircle0084];
    
    MWDrawFillCircle *fillCircle0085 = [[MWDrawFillCircle alloc] init];
    fillCircle0085.center = CGPointMake(2997.5, 1079);
    fillCircle0085.radius = 3;
    fillCircle0085.fillColor = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(72/255.0) alpha:1];
    [station0066.drawPrimitives addObject:fillCircle0085];
    
    MWDrawFillCircle *fillCircle0086 = [[MWDrawFillCircle alloc] init];
    fillCircle0086.center = CGPointMake(2997.5, 1110);
    fillCircle0086.radius = 3;
    fillCircle0086.fillColor = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(72/255.0) alpha:1];
    [station0066.drawPrimitives addObject:fillCircle0086];
    
    MWDrawFillCircle *fillCircle0087 = [[MWDrawFillCircle alloc] init];
    fillCircle0087.center = CGPointMake(2970.5, 1110);
    fillCircle0087.radius = 3;
    fillCircle0087.fillColor = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(72/255.0) alpha:1];
    [station0066.drawPrimitives addObject:fillCircle0087];

    MWDrawLine *drawLine0077 = [[MWDrawLine alloc] init];
    drawLine0077.startPoint = CGPointMake(2970.5, 1079);
    drawLine0077.endPoint = CGPointMake(2997.5, 1079);
    drawLine0077.width = 6;
    drawLine0077.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(72/255.0) alpha:1];
    [station0066.drawPrimitives addObject:drawLine0077];

    MWDrawLine *drawLine0078 = [[MWDrawLine alloc] init];
    drawLine0078.startPoint = CGPointMake(2997.5, 1079);
    drawLine0078.endPoint = CGPointMake(2997.5, 1110);
    drawLine0078.width = 6;
    drawLine0078.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(72/255.0) alpha:1];
    [station0066.drawPrimitives addObject:drawLine0078];

    MWDrawLine *drawLine0079 = [[MWDrawLine alloc] init];
    drawLine0079.startPoint = CGPointMake(2997.5, 1110);
    drawLine0079.endPoint = CGPointMake(2970.5, 1110);
    drawLine0079.width = 6;
    drawLine0079.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(72/255.0) alpha:1];
    [station0066.drawPrimitives addObject:drawLine0079];

    MWDrawLine *drawLine0080 = [[MWDrawLine alloc] init];
    drawLine0080.startPoint = CGPointMake(2970.5, 1110);
    drawLine0080.endPoint = CGPointMake(2970.5, 1079);
    drawLine0080.width = 6;
    drawLine0080.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(72/255.0) alpha:1];
    [station0066.drawPrimitives addObject:drawLine0080];

    MWDrawLine *drawLine0081 = [[MWDrawLine alloc] init];
    drawLine0081.startPoint = CGPointMake(2984, 1110);
    drawLine0081.endPoint = CGPointMake(2984, 1079);
    drawLine0081.width = 26;
    drawLine0081.color = [UIColor colorWithRed:(0/255.0) green:(131/255.0) blue:(72/255.0) alpha:1];
    [station0066.drawPrimitives addObject:drawLine0081];

    MWDrawTextLine *drawTextLine0072 = [[MWDrawTextLine alloc] init];
    drawTextLine0072.text = @"С";
    drawTextLine0072.fontName = @"Arial-BoldMT";
    drawTextLine0072.fontColor = [UIColor whiteColor];
    drawTextLine0072.fontSize = 36;
    drawTextLine0072.kernSpacing = - 1.0;
    drawTextLine0072.origin = CGPointMake(2971, 1074.5);
    [station0066.nameOriginalTextPrimitives addObject:drawTextLine0072];

    // Добавляем перегон
    MWHaul *haul0062 = [[MWHaul alloc] init];
    haul0062.identifier = @"haul0062";
    haul0062.length = 422;
    [edge0018.elements addObject:haul0062];

    MWDrawLine *drawLine0082 = [[MWDrawLine alloc] init];
    drawLine0082.startPoint = CGPointMake(2950.5, 1122);
    drawLine0082.endPoint = CGPointMake(2907, 1078.5);
    drawLine0082.width = 32;
    drawLine0082.color = line0005.color;
    [haul0062.drawPrimitives addObject:drawLine0082];

    // Добавляем станцию Terminal E
    MWStation *station0067 = [[MWStation alloc] init];
    station0067.identifier = @"station0067";
    [edge0018.elements addObject:station0067];
    
    station0067.nameOriginal = @"Logan Airport Term. E";
    station0067.geoLocation = CGPointMake(42.369367, -71.020240);
    station0067.mapLocation = CGPointMake(2907, 1078.5);

    MWDrawFillCircle *fillCircle0088 = [[MWDrawFillCircle alloc] init];
    fillCircle0088.center = station0067.mapLocation;
    fillCircle0088.radius = 9.5;
    fillCircle0088.fillColor = [UIColor whiteColor];
    [station0067.drawPrimitives addObject:fillCircle0088];

    MWDrawFillCircle *fillCircle0089 = [[MWDrawFillCircle alloc] init];
    fillCircle0089.center = CGPointMake(2927.5, 1034.5);
    fillCircle0089.radius = 3;
    fillCircle0089.fillColor = [UIColor colorWithRed:(145/255.0) green:(108/255.0) blue:(175/255.0) alpha:1];
    [station0067.drawPrimitives addObject:fillCircle0089];

    MWDrawFillCircle *fillCircle0090 = [[MWDrawFillCircle alloc] init];
    fillCircle0090.center = CGPointMake(2954.5, 1034.5);
    fillCircle0090.radius = 3;
    fillCircle0090.fillColor = [UIColor colorWithRed:(145/255.0) green:(108/255.0) blue:(175/255.0) alpha:1];
    [station0067.drawPrimitives addObject:fillCircle0090];

    MWDrawFillCircle *fillCircle0091 = [[MWDrawFillCircle alloc] init];
    fillCircle0091.center = CGPointMake(2954.5, 1065);
    fillCircle0091.radius = 3;
    fillCircle0091.fillColor = [UIColor colorWithRed:(145/255.0) green:(108/255.0) blue:(175/255.0) alpha:1];
    [station0067.drawPrimitives addObject:fillCircle0091];

    MWDrawFillCircle *fillCircle0092 = [[MWDrawFillCircle alloc] init];
    fillCircle0092.center = CGPointMake(2927.5, 1065);
    fillCircle0092.radius = 3;
    fillCircle0092.fillColor = [UIColor colorWithRed:(145/255.0) green:(108/255.0) blue:(175/255.0) alpha:1];
    [station0067.drawPrimitives addObject:fillCircle0092];

    MWDrawLine *drawLine0083 = [[MWDrawLine alloc] init];
    drawLine0083.startPoint = CGPointMake(2927.5, 1034.5);
    drawLine0083.endPoint = CGPointMake(2954.5, 1034.5);
    drawLine0083.width = 6;
    drawLine0083.color = [UIColor colorWithRed:(145/255.0) green:(108/255.0) blue:(175/255.0) alpha:1];
    [station0067.drawPrimitives addObject:drawLine0083];

    MWDrawLine *drawLine0084 = [[MWDrawLine alloc] init];
    drawLine0084.startPoint = CGPointMake(2954.5, 1034.5);
    drawLine0084.endPoint = CGPointMake(2954.5, 1065);
    drawLine0084.width = 6;
    drawLine0084.color = [UIColor colorWithRed:(145/255.0) green:(108/255.0) blue:(175/255.0) alpha:1];
    [station0067.drawPrimitives addObject:drawLine0084];

    MWDrawLine *drawLine0085 = [[MWDrawLine alloc] init];
    drawLine0085.startPoint = CGPointMake(2954.5, 1065);
    drawLine0085.endPoint = CGPointMake(2927.5, 1065);
    drawLine0085.width = 6;
    drawLine0085.color = [UIColor colorWithRed:(145/255.0) green:(108/255.0) blue:(175/255.0) alpha:1];
    [station0067.drawPrimitives addObject:drawLine0085];

    MWDrawLine *drawLine0086 = [[MWDrawLine alloc] init];
    drawLine0086.startPoint = CGPointMake(2927.5, 1065);
    drawLine0086.endPoint = CGPointMake(2927.5, 1034.5);
    drawLine0086.width = 6;
    drawLine0086.color = [UIColor colorWithRed:(145/255.0) green:(108/255.0) blue:(175/255.0) alpha:1];
    [station0067.drawPrimitives addObject:drawLine0086];

    MWDrawLine *drawLine0087 = [[MWDrawLine alloc] init];
    drawLine0087.startPoint = CGPointMake(2941, 1065);
    drawLine0087.endPoint = CGPointMake(2941, 1034.5);
    drawLine0087.width = 26;
    drawLine0087.color = [UIColor colorWithRed:(145/255.0) green:(108/255.0) blue:(175/255.0) alpha:1];
    [station0067.drawPrimitives addObject:drawLine0087];

    MWDrawTextLine *drawTextLine0073 = [[MWDrawTextLine alloc] init];
    drawTextLine0073.text = @"E";
    drawTextLine0073.fontName = @"Arial-BoldMT";
    drawTextLine0073.fontColor = [UIColor whiteColor];
    drawTextLine0073.fontSize = 36;
    drawTextLine0073.kernSpacing = - 1.0;
    drawTextLine0073.origin = CGPointMake(2929, 1029.5);
    [station0067.nameOriginalTextPrimitives addObject:drawTextLine0073];

    // Добавляем перегон
    MWHaul *haul0063 = [[MWHaul alloc] init];
    haul0063.identifier = @"haul0063";
    haul0063.length = 3000;
    [edge0018.elements addObject:haul0063];

    MWDrawArc *drawArc0015 = [[MWDrawArc alloc] init];
    drawArc0015.center = CGPointMake(2867.5, 1089);
    drawArc0015.startRadians = 225 * M_PI / 180;
    drawArc0015.endRadians = 315 * M_PI / 180;
    drawArc0015.radius = 35;
    drawArc0015.width = 32;
    drawArc0015.color = line0005.color;
    [haul0063.drawPrimitives addObject:drawArc0015];

    MWDrawLine *drawLine0088 = [[MWDrawLine alloc] init];
    drawLine0088.startPoint = CGPointMake(2907.5, 1079);
    drawLine0088.endPoint = CGPointMake(2891.5, 1063.5);
    drawLine0088.width = 32;
    drawLine0088.color = line0005.color;
    [haul0063.drawPrimitives addObject:drawLine0088];

    MWDrawLine *drawLine0089 = [[MWDrawLine alloc] init];
    drawLine0089.startPoint = CGPointMake(2831, 1064.5);
    drawLine0089.endPoint = CGPointMake(2853.5, 1064.5);
    drawLine0089.width = 22.5;
    drawLine0089.color = line0005.color;
    [haul0063.drawPrimitives addObject:drawLine0089];

    MWDrawLine *drawLine0090 = [[MWDrawLine alloc] init];
    drawLine0090.startPoint = CGPointMake(2837.5, 1070.5);
    drawLine0090.endPoint = CGPointMake(2837.5, 1050.5);
    drawLine0090.width = 2.5;
    drawLine0090.color = [UIColor whiteColor];
    [haul0063.drawPrimitives addObject:drawLine0090];

    MWDrawLine *drawLine0091 = [[MWDrawLine alloc] init];
    drawLine0091.startPoint = CGPointMake(2837.5, 1070.5);
    drawLine0091.endPoint = CGPointMake(2856.5, 1070.5);
    drawLine0091.width = 2.5;
    drawLine0091.color = [UIColor whiteColor];
    [haul0063.drawPrimitives addObject:drawLine0091];

    MWDrawLine *drawLine0092 = [[MWDrawLine alloc] init];
    drawLine0092.startPoint = CGPointMake(2842.5, 1065.5);
    drawLine0092.endPoint = CGPointMake(2842.5, 1046.5);
    drawLine0092.width = 2.5;
    drawLine0092.color = [UIColor whiteColor];
    [haul0063.drawPrimitives addObject:drawLine0092];

    MWDrawLine *drawLine0093 = [[MWDrawLine alloc] init];
    drawLine0093.startPoint = CGPointMake(2842.5, 1065.5);
    drawLine0093.endPoint = CGPointMake(2861.5, 1065.5);
    drawLine0093.width = 2.5;
    drawLine0093.color = [UIColor whiteColor];
    [haul0063.drawPrimitives addObject:drawLine0093];

    MWDrawLine *drawLine0094 = [[MWDrawLine alloc] init];
    drawLine0094.startPoint = CGPointMake(2796, 1160);
    drawLine0094.endPoint = CGPointMake(2796, 1340);
    drawLine0094.width = 32;
    drawLine0094.color = line0005.color;
    [haul0063.drawPrimitives addObject:drawLine0094];

    MWDrawArc *drawArc0017 = [[MWDrawArc alloc] init];
    drawArc0017.center = CGPointMake(2716, 1340);
    drawArc0017.startRadians = 0 * M_PI / 180;
    drawArc0017.endRadians = 45 * M_PI / 180;
    drawArc0017.radius = 80;
    drawArc0017.width = 32;
    drawArc0017.color = line0005.color;
    [haul0063.drawPrimitives addObject:drawArc0017];

    MWDrawLine *drawLine0095 = [[MWDrawLine alloc] init];
    drawLine0095.startPoint = CGPointMake(2774.5, 1394.5);
    drawLine0095.endPoint = CGPointMake(2645, 1526.5);
    drawLine0095.width = 32;
    drawLine0095.color = line0005.color;
    [haul0063.drawPrimitives addObject:drawLine0095];

    MWDrawArc *drawArc0018 = [[MWDrawArc alloc] init];
    drawArc0018.center = CGPointMake(2589.5, 1469);
    drawArc0018.startRadians = 45 * M_PI / 180;
    drawArc0018.endRadians = 90 * M_PI / 180;
    drawArc0018.radius = 80;
    drawArc0018.width = 32;
    drawArc0018.color = line0005.color;
    [haul0063.drawPrimitives addObject:drawArc0018];

    MWDrawLine *drawLine0096 = [[MWDrawLine alloc] init];
    drawLine0096.startPoint = CGPointMake(2590, 1549);
    drawLine0096.endPoint = CGPointMake(2579, 1549);
    drawLine0096.width = 32;
    drawLine0096.color = line0005.color;
    [haul0063.drawPrimitives addObject:drawLine0096];

    // Добавляем станцию Silver Line Way
    MWStation *station0068 = [[MWStation alloc] init];
    station0068.identifier = @"station0068";
    [edge0018.elements addObject:station0068];
    
    station0068.nameOriginal = @"Silver Line Way (SL1)";
    station0068.geoLocation = CGPointMake(42.3472, -71.0386);
    station0068.mapLocation = CGPointMake(2579, 1549);
    station0068.platformIndex = 1;

    MWDrawFillCircle *fillCircle0093 = [[MWDrawFillCircle alloc] init];
    fillCircle0093.center = station0068.mapLocation;
    fillCircle0093.radius = 9.5;
    fillCircle0093.fillColor = [UIColor whiteColor];
    [station0068.drawPrimitives addObject:fillCircle0093];

    MWDrawTextLine *drawTextLine0074 = [[MWDrawTextLine alloc] init];
    drawTextLine0074.text = @"Silver Line Way";
    drawTextLine0074.fontName = @"Baskerville";
    drawTextLine0074.fontColor = [UIColor blackColor];
    drawTextLine0074.fontSize = 34;
    drawTextLine0074.origin = CGPointMake(2599, 1483);
    drawTextLine0074.degrees = -45;
    drawTextLine0074.kernSpacing = - 1.5;
    [station0068.nameOriginalTextPrimitives addObject:drawTextLine0074];

    // Добавляем вершину
    edge0018.finishVertex = vertex0020;

    // Создаем участок линии  Silver Line Way - Terminal A
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0019 = [[MWEdge alloc] init];
    edge0019.identifier = @"edge0019";
    edge0019.developmentName = @"Ребро: Silver Line Way - Terminal A";
    [self.edges addObject:edge0019];
    
    // Добавляем линию
    edge0019.line = line0005;
    
    // Добавляем вершину
    edge0019.startVertex = vertex0020;

    // Добавляем станцию Silver Line Way
    [edge0019.elements addObject:station0068];
    edge0019.directionFromStation = station0068;

    // Добавляем перегон
    MWHaul *haul0064 = [[MWHaul alloc] init];
    haul0064.identifier = @"haul0064";
    haul0064.length = 2900;
    [edge0019.elements addObject:haul0064];

    MWDrawArc *drawArc0019 = [[MWDrawArc alloc] init];
    drawArc0019.center = CGPointMake(2821.5, 1160);
    drawArc0019.startRadians = 180 * M_PI / 180;
    drawArc0019.endRadians = 315 * M_PI / 180;
    drawArc0019.radius = 25.5;
    drawArc0019.width = 32;
    drawArc0019.color = line0005.color;
    [haul0064.drawPrimitives addObject:drawArc0019];
    
    MWDrawLine *drawLine0097 = [[MWDrawLine alloc] init];
    drawLine0097.startPoint = CGPointMake(2796, 1160);
    drawLine0097.endPoint = CGPointMake(2796, 1340);
    drawLine0097.width = 32;
    drawLine0097.color = line0005.color;
    [haul0064.drawPrimitives addObject:drawLine0097];
    
    MWDrawArc *drawArc0020 = [[MWDrawArc alloc] init];
    drawArc0020.center = CGPointMake(2716, 1340);
    drawArc0020.startRadians = 0 * M_PI / 180;
    drawArc0020.endRadians = 45 * M_PI / 180;
    drawArc0020.radius = 80;
    drawArc0020.width = 32;
    drawArc0020.color = line0005.color;
    [haul0064.drawPrimitives addObject:drawArc0020];
    
    MWDrawLine *drawLine0098 = [[MWDrawLine alloc] init];
    drawLine0098.startPoint = CGPointMake(2774.5, 1394.5);
    drawLine0098.endPoint = CGPointMake(2645, 1526.5);
    drawLine0098.width = 32;
    drawLine0098.color = line0005.color;
    [haul0064.drawPrimitives addObject:drawLine0098];
    
    MWDrawArc *drawArc0021 = [[MWDrawArc alloc] init];
    drawArc0021.center = CGPointMake(2589.5, 1469);
    drawArc0021.startRadians = 45 * M_PI / 180;
    drawArc0021.endRadians = 90 * M_PI / 180;
    drawArc0021.radius = 80;
    drawArc0021.width = 32;
    drawArc0021.color = line0005.color;
    [haul0064.drawPrimitives addObject:drawArc0021];
    
    MWDrawLine *drawLine0099 = [[MWDrawLine alloc] init];
    drawLine0099.startPoint = CGPointMake(2590, 1549);
    drawLine0099.endPoint = CGPointMake(2579, 1549);
    drawLine0099.width = 32;
    drawLine0099.color = line0005.color;
    [haul0064.drawPrimitives addObject:drawLine0099];

    MWDrawLine *drawLine0100 = [[MWDrawLine alloc] init];
    drawLine0100.startPoint = CGPointMake(2838.5, 1141);
    drawLine0100.endPoint = CGPointMake(2862, 1164.5);
    drawLine0100.width = 32;
    drawLine0100.color = line0005.color;
    [haul0064.drawPrimitives addObject:drawLine0100];

    // Добавляем станцию Terminal A
    [edge0019.elements addObject:station0063];

    // Добавляем вершину
    edge0019.finishVertex = vertex0019;

    // Создаем участок линии  Silver Line Way - World Trade Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0020 = [[MWEdge alloc] init];
    edge0020.identifier = @"edge0020";
    edge0020.developmentName = @"Ребро: Silver Line Way - World Trade Ctr";
    [self.edges addObject:edge0020];
    
    // Добавляем линию
    edge0020.line = line0005;
    
    // Добавляем вершину
    edge0020.startVertex = vertex0020;

    // Добавляем станцию Silver Line Way
    [edge0020.elements addObject:station0068];
    
    // Добавляем перегон
    MWHaul *haul0065 = [[MWHaul alloc] init];
    haul0065.identifier = @"haul0065";
    haul0065.length = 600;
    [edge0020.elements addObject:haul0065];
    
    MWDrawLine *drawLine0101 = [[MWDrawLine alloc] init];
    drawLine0101.startPoint = CGPointMake(2525, 1548.5);
    drawLine0101.endPoint = CGPointMake(2579.5, 1549);
    drawLine0101.width = 32;
    drawLine0101.color = line0005.color;
    [haul0065.drawPrimitives addObject:drawLine0101];

    // Добавляем станцию World Trade Ctr
    MWStation *station0069 = [[MWStation alloc] init];
    station0069.identifier = @"station0069";
    [edge0020.elements addObject:station0069];
    
    station0069.nameOriginal = @"World Trade Center";
    station0069.geoLocation = CGPointMake(42.348667, -71.042525);
    station0069.mapLocation = CGPointMake(2525, 1548.5);
    station0069.platformIndex = 1;

    MWDrawFillCircle *fillCircle0094 = [[MWDrawFillCircle alloc] init];
    fillCircle0094.center = station0069.mapLocation;
    fillCircle0094.radius = 9.5;
    fillCircle0094.fillColor = [UIColor whiteColor];
    [station0069.drawPrimitives addObject:fillCircle0094];
    
    MWDrawTextLine *drawTextLine0075 = [[MWDrawTextLine alloc] init];
    drawTextLine0075.text = @"World Trade Ctr";
    drawTextLine0075.fontName = @"Baskerville";
    drawTextLine0075.fontColor = [UIColor blackColor];
    drawTextLine0075.fontSize = 34;
    drawTextLine0075.origin = CGPointMake(2545, 1481.5);
    drawTextLine0075.degrees = -45;
    drawTextLine0075.kernSpacing = - 2.3;
    [station0069.nameOriginalTextPrimitives addObject:drawTextLine0075];

    // Добавляем вершину
    edge0020.finishVertex = vertex0023;

    // Создаем участок линии  World Trade Ctr - Courthouse
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0021 = [[MWEdge alloc] init];
    edge0021.identifier = @"edge0021";
    edge0021.developmentName = @"Ребро: World Trade Ctr - Courthouse";
    [self.edges addObject:edge0021];
    
    // Добавляем линию
    edge0021.line = line0005;
    
    // Добавляем вершину
    edge0021.startVertex = vertex0023;

    // Добавляем станцию World Trade Ctr
    [edge0021.elements addObject:station0069];

    // Добавляем перегон
    MWHaul *haul0066 = [[MWHaul alloc] init];
    haul0066.identifier = @"haul0066";
    haul0066.length = 403;
    [edge0021.elements addObject:haul0066];

    MWDrawLine *drawLine0102 = [[MWDrawLine alloc] init];
    drawLine0102.startPoint = CGPointMake(2525.5, 1548.5);
    drawLine0102.endPoint = CGPointMake(2471, 1548.5);
    drawLine0102.width = 32;
    drawLine0102.color = line0005.color;
    [haul0066.drawPrimitives addObject:drawLine0102];

    // Добавляем станцию Courthouse
    MWStation *station0070 = [[MWStation alloc] init];
    station0070.identifier = @"station0070";
    [edge0021.elements addObject:station0070];
    
    station0070.nameOriginal = @"Courthouse";
    station0070.geoLocation = CGPointMake(42.352336, -71.046573);
    station0070.mapLocation = CGPointMake(2471, 1548.5);
    station0070.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0095 = [[MWDrawFillCircle alloc] init];
    fillCircle0095.center = station0070.mapLocation;
    fillCircle0095.radius = 9.5;
    fillCircle0095.fillColor = [UIColor whiteColor];
    [station0070.drawPrimitives addObject:fillCircle0095];

    MWDrawTextLine *drawTextLine0076 = [[MWDrawTextLine alloc] init];
    drawTextLine0076.text = station0070.nameOriginal;
    drawTextLine0076.fontName = @"Baskerville";
    drawTextLine0076.fontColor = [UIColor blackColor];
    drawTextLine0076.fontSize = 34;
    drawTextLine0076.origin = CGPointMake(2490, 1481.5);
    drawTextLine0076.degrees = -45;
    drawTextLine0076.kernSpacing = - 2.3;
    [station0070.nameOriginalTextPrimitives addObject:drawTextLine0076];

    // Добавляем вершину
    edge0021.finishVertex = vertex0024;

    // Создаем участок линии  Courthouse - South Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0022 = [[MWEdge alloc] init];
    edge0022.identifier = @"edge002";
    edge0022.developmentName = @"Ребро: Courthouse - South Station";
    [self.edges addObject:edge0022];
    
    // Добавляем линию
    edge0022.line = line0005;
    
    // Добавляем вершину
    edge0022.startVertex = vertex0024;

    // Добавляем станцию Courthouse
    [edge0022.elements addObject:station0069];

    // Добавляем перегон
    MWHaul *haul0067 = [[MWHaul alloc] init];
    haul0067.identifier = @"haul0067";
    haul0067.length = 882;
    [edge0022.elements addObject:haul0067];

    MWDrawLine *drawLine0103 = [[MWDrawLine alloc] init];
    drawLine0103.startPoint = CGPointMake(2471.5, 1548.5);
    drawLine0103.endPoint = CGPointMake(2338, 1549);
    drawLine0103.width = 32;
    drawLine0103.color = line0005.color;
    [haul0067.drawPrimitives addObject:drawLine0103];

    MWDrawTextLine *drawTextLine0077 = [[MWDrawTextLine alloc] init];
    drawTextLine0077.text = @"SL1 & SL2";
    drawTextLine0077.fontName = @"Baskerville";
    drawTextLine0077.fontColor = [UIColor whiteColor];
    drawTextLine0077.fontSize = 20;
    drawTextLine0077.origin = CGPointMake(2360, 1536.5);
    drawTextLine0077.kernSpacing = - 0.0;
    [haul0067.drawPrimitives addObject:drawTextLine0077];

    MWDrawFillCircle *fillCircle0096 = [[MWDrawFillCircle alloc] init];
    fillCircle0096.center = CGPointMake(2338, 1549);
    fillCircle0096.radius = 16;
    fillCircle0096.fillColor = line0005.color;
    [haul0067.drawPrimitives addObject:fillCircle0096];
    
    MWDrawFillCircle *fillCircle0097 = [[MWDrawFillCircle alloc] init];
    fillCircle0097.center = CGPointMake(2338, 1549);
    fillCircle0097.radius = 9.5;
    fillCircle0097.fillColor = [UIColor whiteColor];
    [haul0067.drawPrimitives addObject:fillCircle0097];

    // Добавляем станцию South Station
    MWStation *station0071 = [[MWStation alloc] init];
    station0071.identifier = @"station0071";
    [edge0022.elements addObject:station0071];
    
    station0071.nameOriginal = @"South Station";
    station0071.geoLocation = CGPointMake(42.35261, -71.05536);
    station0071.mapLocation = CGPointMake(2338, 1549);
    station0071.platformIndex = 1;
    
    station0071.showNameOnMap = NO;
    [station0071.nameOriginalTextPrimitives addObject:drawTextLine0012];
    [station0071.nameOriginalTextPrimitives addObject:drawTextLine0013];
    
    // Добавляем вершину
    edge0022.finishVertex = vertex0004;

    ////////////////////////////////////////////////////////////////
    // 6. Silver Line SL2
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Tide St - Black Falcon Ave
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0023 = [[MWEdge alloc] init];
    edge0023.identifier = @"edge0023";
    edge0023.developmentName = @"Ребро: Tide St - Black Falcon Ave";
    [self.edges addObject:edge0023];
    
    // Добавляем линию
    edge0023.line = line0006;
    
    // Добавляем вершину
    edge0023.startVertex = vertex0021;
    
    // Добавляем станцию Tide St
    MWStation *station0072 = [[MWStation alloc] init];
    station0072.identifier = @"station0072";
    [edge0023.elements addObject:station0072];
    
    station0072.nameOriginal = @"Tide Street";
    edge0023.directionFromStation = station0072;
    station0072.geoLocation = CGPointMake(42.345121, -71.032036);
    station0072.mapLocation = CGPointMake(2654, 1624.5);

    MWDrawFillCircle *fillCircle0098 = [[MWDrawFillCircle alloc] init];
    fillCircle0098.center = station0072.mapLocation;
    fillCircle0098.radius = 9.5;
    fillCircle0098.fillColor = [UIColor whiteColor];
    [station0072.drawPrimitives addObject:fillCircle0098];

    MWDrawTextLine *drawTextLine0078 = [[MWDrawTextLine alloc] init];
    drawTextLine0078.text = @"Tide St";
    drawTextLine0078.fontName = @"Baskerville";
    drawTextLine0078.fontColor = [UIColor blackColor];
    drawTextLine0078.fontSize = 34;
    drawTextLine0078.origin = CGPointMake(2482, 1606);
    drawTextLine0078.kernSpacing = - 1.6;
    [station0072.nameOriginalTextPrimitives addObject:drawTextLine0078];

    // Добавляем перегон
    MWHaul *haul0068 = [[MWHaul alloc] init];
    haul0068.identifier = @"haul0068";
    haul0068.length = 148;
    [edge0023.elements addObject:haul0068];

    MWDrawArc *drawArc0022 = [[MWDrawArc alloc] init];
    drawArc0022.center = CGPointMake(2693.5, 1555);
    drawArc0022.startRadians = 90 * M_PI / 180;
    drawArc0022.endRadians = 119.5 * M_PI / 180;
    drawArc0022.radius = 80;
    drawArc0022.width = 32;
    drawArc0022.color = line0005.color;
    [haul0068.drawPrimitives addObject:drawArc0022];
    
    MWDrawLine *drawLine0104 = [[MWDrawLine alloc] init];
    drawLine0104.startPoint = CGPointMake(2693, 1635);
    drawLine0104.endPoint = CGPointMake(2720, 1635);
    drawLine0104.width = 32;
    drawLine0104.color = line0005.color;
    [haul0068.drawPrimitives addObject:drawLine0104];

    // Добавляем станцию 21 Dry Dock Ave
    MWStation *station0073 = [[MWStation alloc] init];
    station0073.identifier = @"station0073";
    [edge0023.elements addObject:station0073];
    
    station0073.nameOriginal = @"21 Dry Dock Avenue";
    station0073.geoLocation = CGPointMake(42.344692, -71.031056);
    station0073.mapLocation = CGPointMake(2720, 1635);

    MWDrawFillCircle *fillCircle0099 = [[MWDrawFillCircle alloc] init];
    fillCircle0099.center = station0073.mapLocation;
    fillCircle0099.radius = 9.5;
    fillCircle0099.fillColor = [UIColor whiteColor];
    [station0073.drawPrimitives addObject:fillCircle0099];

    MWDrawTextLine *drawTextLine0079 = [[MWDrawTextLine alloc] init];
    drawTextLine0079.text = @"21 Dry Dock Ave";
    drawTextLine0079.fontName = @"Baskerville";
    drawTextLine0079.fontColor = [UIColor blackColor];
    drawTextLine0079.fontSize = 34;
    drawTextLine0079.origin = CGPointMake(2736.5, 1573.5);
    drawTextLine0079.degrees = -45;
    drawTextLine0079.kernSpacing = - 1.7;
    [station0073.nameOriginalTextPrimitives addObject:drawTextLine0079];

    // Добавляем перегон
    MWHaul *haul0069 = [[MWHaul alloc] init];
    haul0069.identifier = @"haul0069";
    haul0069.length = 213;
    [edge0023.elements addObject:haul0069];

    MWDrawLine *drawLine0105 = [[MWDrawLine alloc] init];
    drawLine0105.startPoint = CGPointMake(2719.5, 1635);
    drawLine0105.endPoint = CGPointMake(2776.5, 1635.5);
    drawLine0105.width = 32;
    drawLine0105.color = line0005.color;
    [haul0069.drawPrimitives addObject:drawLine0105];

    // Добавляем станцию 25 Dry Dock Ave
    MWStation *station0074 = [[MWStation alloc] init];
    station0074.identifier = @"station0074";
    [edge0023.elements addObject:station0074];
    
    station0074.nameOriginal = @"25 Dry Dock Avenue";
    station0074.geoLocation = CGPointMake(42.344747, -71.028468);
    station0074.mapLocation = CGPointMake(2776.5, 1635.5);

    MWDrawFillCircle *fillCircle0100 = [[MWDrawFillCircle alloc] init];
    fillCircle0100.center = station0074.mapLocation;
    fillCircle0100.radius = 9.5;
    fillCircle0100.fillColor = [UIColor whiteColor];
    [station0074.drawPrimitives addObject:fillCircle0100];

    MWDrawTextLine *drawTextLine0080 = [[MWDrawTextLine alloc] init];
    drawTextLine0080.text = @"25 Dry Dock Ave";
    drawTextLine0080.fontName = @"Baskerville";
    drawTextLine0080.fontColor = [UIColor blackColor];
    drawTextLine0080.fontSize = 34;
    drawTextLine0080.origin = CGPointMake(2792, 1572.5);
    drawTextLine0080.degrees = -45;
    drawTextLine0080.kernSpacing = - 1.8;
    [station0074.nameOriginalTextPrimitives addObject:drawTextLine0080];

    // Добавляем перегон
    MWHaul *haul0070 = [[MWHaul alloc] init];
    haul0070.identifier = @"haul0070";
    haul0070.length = 148;
    [edge0023.elements addObject:haul0070];
    
    MWDrawLine *drawLine0106 = [[MWDrawLine alloc] init];
    drawLine0106.startPoint = CGPointMake(2776, 1635.5);
    drawLine0106.endPoint = CGPointMake(2803, 1635.5);
    drawLine0106.width = 32;
    drawLine0106.color = line0005.color;
    [haul0070.drawPrimitives addObject:drawLine0106];

    MWDrawArc *drawArc0023 = [[MWDrawArc alloc] init];
    drawArc0023.center = CGPointMake(2803, 1665.5);
    drawArc0023.startRadians = 270 * M_PI / 180;
    drawArc0023.endRadians = 1 * M_PI / 180;
    drawArc0023.radius = 29.75;
    drawArc0023.width = 32;
    drawArc0023.color = line0005.color;
    [haul0070.drawPrimitives addObject:drawArc0023];

    // Добавляем станцию Black Falcon Ave
    MWStation *station0075 = [[MWStation alloc] init];
    station0075.identifier = @"station0075";
    [edge0023.elements addObject:station0075];
    
    station0075.nameOriginal = @"Black Falcon Avenue";
    station0075.geoLocation = CGPointMake(42.344279, -71.027267);
    station0075.mapLocation = CGPointMake(2832.5, 1665);
    
    MWDrawFillCircle *fillCircle0101 = [[MWDrawFillCircle alloc] init];
    fillCircle0101.center = station0075.mapLocation;
    fillCircle0101.radius = 9.5;
    fillCircle0101.fillColor = [UIColor whiteColor];
    [station0075.drawPrimitives addObject:fillCircle0101];

    MWDrawTextLine *drawTextLine0081 = [[MWDrawTextLine alloc] init];
    drawTextLine0081.text = @"Black";
    drawTextLine0081.fontName = @"Baskerville";
    drawTextLine0081.fontColor = [UIColor blackColor];
    drawTextLine0081.fontSize = 34;
    drawTextLine0081.origin = CGPointMake(2883, 1646);
    drawTextLine0081.kernSpacing = - 1.4;
    [station0075.nameOriginalTextPrimitives addObject:drawTextLine0081];

    MWDrawTextLine *drawTextLine0082 = [[MWDrawTextLine alloc] init];
    drawTextLine0082.text = @"Falcon Ave";
    drawTextLine0082.fontName = @"Baskerville";
    drawTextLine0082.fontColor = [UIColor blackColor];
    drawTextLine0082.fontSize = 34;
    drawTextLine0082.origin = CGPointMake(2883, 1675);
    drawTextLine0082.kernSpacing = - 1.3;
    [station0075.nameOriginalTextPrimitives addObject:drawTextLine0082];

    // Добавляем вершину
    edge0023.finishVertex = vertex0022;
    
    // Создаем участок линии Black Falcon Ave - Tide St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0024 = [[MWEdge alloc] init];
    edge0024.identifier = @"edge0024";
    edge0024.developmentName = @"Ребро: Black Falcon Ave - Tide St";
    [self.edges addObject:edge0024];
    
    // Добавляем линию
    edge0024.line = line0006;
    
    // Добавляем вершину
    edge0024.startVertex = vertex0022;

    // Добавляем станцию Black Falcon Ave
    [edge0024.elements addObject:station0075];
    edge0024.directionFromStation = station0075;

    // Добавляем перегон
    MWHaul *haul0071 = [[MWHaul alloc] init];
    haul0071.identifier = @"haul0071";
    haul0071.length = 689;
    [edge0024.elements addObject:haul0071];

    MWDrawArc *drawArc0024 = [[MWDrawArc alloc] init];
    drawArc0024.center = CGPointMake(2803, 1665.5);
    drawArc0024.startRadians = 359 * M_PI / 180;
    drawArc0024.endRadians = 90 * M_PI / 180;
    drawArc0024.radius = 29.75;
    drawArc0024.width = 32;
    drawArc0024.color = line0005.color;
    [haul0071.drawPrimitives addObject:drawArc0024];

    MWDrawLine *drawLine0107 = [[MWDrawLine alloc] init];
    drawLine0107.startPoint = CGPointMake(2751, 1695.25);
    drawLine0107.endPoint = CGPointMake(2803, 1695.25);
    drawLine0107.width = 32;
    drawLine0107.color = line0005.color;
    [haul0071.drawPrimitives addObject:drawLine0107];

    MWDrawArc *drawArc0025 = [[MWDrawArc alloc] init];
    drawArc0025.center = CGPointMake(2751, 1620);
    drawArc0025.startRadians = 90 * M_PI / 180;
    drawArc0025.endRadians = 121 * M_PI / 180; // 140
    drawArc0025.radius = 75;
    drawArc0025.width = 32;
    drawArc0025.color = line0005.color;
    [haul0071.drawPrimitives addObject:drawArc0025];

    // Добавляем станцию Design Center
    MWStation *station0076 = [[MWStation alloc] init];
    station0076.identifier = @"station0076";
    [edge0024.elements addObject:station0076];
    
    station0076.nameOriginal = @"Design Center";
    station0076.geoLocation = CGPointMake(42.344637, -71.034531);
    station0076.mapLocation = CGPointMake(2712.5, 1685);

    MWDrawFillCircle *fillCircle0102 = [[MWDrawFillCircle alloc] init];
    fillCircle0102.center = station0076.mapLocation;
    fillCircle0102.radius = 9.5;
    fillCircle0102.fillColor = [UIColor whiteColor];
    [station0076.drawPrimitives addObject:fillCircle0102];

    MWDrawTextLine *drawTextLine0083 = [[MWDrawTextLine alloc] init];
    drawTextLine0083.text = @"DESIGN";
    drawTextLine0083.fontName = @"Baskerville";
    drawTextLine0083.fontColor = [UIColor blackColor];
    drawTextLine0083.fontSize = 36;
    drawTextLine0083.origin = CGPointMake(2510, 1667.5);
    drawTextLine0083.kernSpacing = -0.8;
    [station0076.nameOriginalTextPrimitives addObject:drawTextLine0083];

    MWDrawTextLine *drawTextLine0084 = [[MWDrawTextLine alloc] init];
    drawTextLine0084.text = @"CENTER";
    drawTextLine0084.fontName = @"Baskerville";
    drawTextLine0084.fontColor = [UIColor blackColor];
    drawTextLine0084.fontSize = 36;
    drawTextLine0084.origin = CGPointMake(2500, 1700);
    drawTextLine0084.kernSpacing = -1.0;
    [station0076.nameOriginalTextPrimitives addObject:drawTextLine0084];

    // Добавляем перегон
    MWHaul *haul0072 = [[MWHaul alloc] init];
    haul0072.identifier = @"haul0072";
    haul0072.length = 259;
    [edge0024.elements addObject:haul0072];

    MWDrawArc *drawArc0026 = [[MWDrawArc alloc] init];
    drawArc0026.center = CGPointMake(2751, 1620);
    drawArc0026.startRadians = 120.5 * M_PI / 180;
    drawArc0026.endRadians = 140 * M_PI / 180; // 140
    drawArc0026.radius = 75;
    drawArc0026.width = 32;
    drawArc0026.color = line0005.color;
    [haul0072.drawPrimitives addObject:drawArc0026];

    MWDrawLine *drawLine0108 = [[MWDrawLine alloc] init];
    drawLine0108.startPoint = CGPointMake(2681, 1668);
    drawLine0108.endPoint = CGPointMake(2705, 1668);
    drawLine0108.width = 22.5;
    drawLine0108.color = line0006.color;
    [haul0072.drawPrimitives addObject:drawLine0108];

    MWDrawLine *drawLine0109 = [[MWDrawLine alloc] init];
    drawLine0109.startPoint = CGPointMake(2692.5, 1667.5);
    drawLine0109.endPoint = CGPointMake(2711.5, 1667.5);
    drawLine0109.width = 2.5;
    drawLine0109.color = [UIColor whiteColor];
    [haul0072.drawPrimitives addObject:drawLine0109];

    MWDrawLine *drawLine0110 = [[MWDrawLine alloc] init];
    drawLine0110.startPoint = CGPointMake(2692.5, 1667.5);
    drawLine0110.endPoint = CGPointMake(2692.5, 1686.5);
    drawLine0110.width = 2.5;
    drawLine0110.color = [UIColor whiteColor];
    [haul0072.drawPrimitives addObject:drawLine0110];

    MWDrawLine *drawLine0111 = [[MWDrawLine alloc] init];
    drawLine0111.startPoint = CGPointMake(2687.5, 1662.5);
    drawLine0111.endPoint = CGPointMake(2706.5, 1662.5);
    drawLine0111.width = 2.5;
    drawLine0111.color = [UIColor whiteColor];
    [haul0072.drawPrimitives addObject:drawLine0111];

    MWDrawLine *drawLine0112 = [[MWDrawLine alloc] init];
    drawLine0112.startPoint = CGPointMake(2687.5, 1662.5);
    drawLine0112.endPoint = CGPointMake(2687.5, 1679.5);
    drawLine0112.width = 2.5;
    drawLine0112.color = [UIColor whiteColor];
    [haul0072.drawPrimitives addObject:drawLine0112];

    // Добавляем станцию Tide St
    [edge0024.elements addObject:station0072];

    // Добавляем вершину
    edge0024.finishVertex = vertex0021;

    // Создаем участок линии Tide St - Silver Line Way
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0025 = [[MWEdge alloc] init];
    edge0025.identifier = @"edge0025";
    edge0025.developmentName = @"Ребро: Tide St - Silver Line Way";
    [self.edges addObject:edge0025];
    
    // Добавляем линию
    edge0025.line = line0006;
    
    // Добавляем вершину
    edge0025.startVertex = vertex0021;

    // Добавляем станцию Tide St
    [edge0025.elements addObject:station0072];

    // Добавляем перегон
    MWHaul *haul0073 = [[MWHaul alloc] init];
    haul0073.identifier = @"haul0073";
    haul0073.length = 282;
    [edge0025.elements addObject:haul0073];

    MWDrawArc *drawArc0027 = [[MWDrawArc alloc] init];
    drawArc0027.center = CGPointMake(2693.5, 1555);
    drawArc0027.startRadians = 119 * M_PI / 180;
    drawArc0027.endRadians = 135 * M_PI / 180;
    drawArc0027.radius = 80;
    drawArc0027.width = 32;
    drawArc0027.color = line0005.color;
    [haul0073.drawPrimitives addObject:drawArc0027];
    
    MWDrawLine *drawLine0113 = [[MWDrawLine alloc] init];
    drawLine0113.startPoint = CGPointMake(2614, 1589.5);
    drawLine0113.endPoint = CGPointMake(2638, 1612.5);
    drawLine0113.width = 32;
    drawLine0113.color = line0005.color;
    [haul0073.drawPrimitives addObject:drawLine0113];

    // Добавляем станцию Harbor St
    MWStation *station0077 = [[MWStation alloc] init];
    station0077.identifier = @"station0077";
    [edge0025.elements addObject:station0077];
    
    station0077.nameOriginal = @"Harbor Street";
    station0077.geoLocation = CGPointMake(42.346593, -71.034925);
    station0077.mapLocation = CGPointMake(2614, 1589.5);

    MWDrawFillCircle *fillCircle0103 = [[MWDrawFillCircle alloc] init];
    fillCircle0103.center = station0077.mapLocation;
    fillCircle0103.radius = 9.5;
    fillCircle0103.fillColor = [UIColor whiteColor];
    [station0077.drawPrimitives addObject:fillCircle0103];

    // Добавляем перегон
    MWHaul *haul0074 = [[MWHaul alloc] init];
    haul0074.identifier = @"haul0074";
    haul0074.length = 448;
    [edge0025.elements addObject:haul0074];

    MWDrawLine *drawLine0114 = [[MWDrawLine alloc] init];
    drawLine0114.startPoint = CGPointMake(2614.5, 1590);
    drawLine0114.endPoint = CGPointMake(2573, 1549);
    drawLine0114.width = 32;
    drawLine0114.color = line0005.color;
    [haul0074.drawPrimitives addObject:drawLine0114];

    // Добавляем станцию Silver Line Way
    MWStation *station0078 = [[MWStation alloc] init];
    station0078.identifier = @"station0078";
    [edge0025.elements addObject:station0078];
    
    station0078.nameOriginal = @"Silver Line Way (SL2)";
    station0078.geoLocation = CGPointMake(42.3472, -71.0386);
    station0078.mapLocation = CGPointMake(2579, 1549);
    station0078.platformIndex = 1;

    MWDrawFillCircle *fillCircle0104 = [[MWDrawFillCircle alloc] init];
    fillCircle0104.center = station0078.mapLocation;
    fillCircle0104.radius = 9.5;
    fillCircle0104.fillColor = [UIColor whiteColor];
    [station0078.drawPrimitives addObject:fillCircle0104];

    station0078.showNameOnMap = NO;
    [station0078.nameOriginalTextPrimitives addObject:drawTextLine0074];
    
    // Добавляем вершину
    edge0025.finishVertex = vertex0020;

    // Создаем участок линии Silver Line Way - World Trade Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0026 = [[MWEdge alloc] init];
    edge0026.identifier = @"edge0026";
    edge0026.developmentName = @"Ребро: Silver Line Way - World Trade Ctr";
    [self.edges addObject:edge0026];
    
    // Добавляем линию
    edge0026.line = line0006;
    
    // Добавляем вершину
    edge0026.startVertex = vertex0020;

    // Добавляем станцию Silver Line Way
    [edge0026.elements addObject:station0078];

    // Добавляем перегон
    MWHaul *haul0075 = [[MWHaul alloc] init];
    haul0075.identifier = @"haul0075";
    haul0075.length = 600;
    [edge0026.elements addObject:haul0075];

    haul0075.showOnMap = NO;
    [haul0075.drawPrimitives addObject:drawLine0101];
    
    // Добавляем станцию World Trade Ctr
    MWStation *station0079 = [[MWStation alloc] init];
    station0079.identifier = @"station0079";
    [edge0026.elements addObject:station0079];
    
    station0079.nameOriginal = @"World Trade Center";
    station0079.geoLocation = CGPointMake(42.348667, -71.042525);
    station0079.mapLocation = CGPointMake(2525, 1548.5);
    station0079.platformIndex = 1;

    MWDrawFillCircle *fillCircle0105 = [[MWDrawFillCircle alloc] init];
    fillCircle0105.center = station0079.mapLocation;
    fillCircle0105.radius = 9.5;
    fillCircle0105.fillColor = [UIColor whiteColor];
    [station0079.drawPrimitives addObject:fillCircle0105];

    station0079.showNameOnMap = NO;
    [station0079.nameOriginalTextPrimitives addObject:drawTextLine0075];
    
    // Добавляем вершину
    edge0026.finishVertex = vertex0023;

    // Создаем участок линии World Trade Ctr - Courthouse
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0027 = [[MWEdge alloc] init];
    edge0027.identifier = @"edge0027";
    edge0027.developmentName = @"Ребро: World Trade Ctr - Courthouse";
    [self.edges addObject:edge0027];
    
    // Добавляем линию
    edge0027.line = line0006;
    
    // Добавляем вершину
    edge0027.startVertex = vertex0023;

    // Добавляем станцию World Trade Ctr
    [edge0027.elements addObject:station0079];

    // Добавляем перегон
    MWHaul *haul0076 = [[MWHaul alloc] init];
    haul0076.identifier = @"haul0076";
    haul0076.length = 403;
    [edge0027.elements addObject:haul0076];
    
    haul0076.showOnMap = NO;
    [haul0076.drawPrimitives addObject:drawLine0102];
    
    // Добавляем станцию Courthouse
    MWStation *station0080 = [[MWStation alloc] init];
    station0080.identifier = @"station0080";
    [edge0027.elements addObject:station0080];
    
    station0080.nameOriginal = @"Courthouse";
    station0080.geoLocation = CGPointMake(42.352336, -71.046573);
    station0080.mapLocation = CGPointMake(2471, 1548.5);
    station0080.platformIndex = 1;

    MWDrawFillCircle *fillCircle0106 = [[MWDrawFillCircle alloc] init];
    fillCircle0106.center = station0080.mapLocation;
    fillCircle0106.radius = 9.5;
    fillCircle0106.fillColor = [UIColor whiteColor];
    [station0080.drawPrimitives addObject:fillCircle0106];

    station0080.showNameOnMap = NO;
    [station0080.nameOriginalTextPrimitives addObject:drawTextLine0076];
    
    // Добавляем вершину
    edge0027.finishVertex = vertex0024;

    // Создаем участок линии Courthouse - South Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0028 = [[MWEdge alloc] init];
    edge0028.identifier = @"edge0028";
    edge0028.developmentName = @"Ребро: Courthouse - South Station";
    [self.edges addObject:edge0028];
    
    // Добавляем линию
    edge0028.line = line0006;
    
    // Добавляем вершину
    edge0028.startVertex = vertex0024;

    // Добавляем станцию Courthouse
    [edge0028.elements addObject:station0080];

    // Добавляем перегон
    MWHaul *haul0077 = [[MWHaul alloc] init];
    haul0077.identifier = @"haul0077";
    haul0077.length = 882;
    [edge0028.elements addObject:haul0077];
    
    haul0077.showOnMap = NO;
    [haul0077.drawPrimitives addObject:drawLine0103];
    [haul0077.drawPrimitives addObject:drawTextLine0077];
    [haul0077.drawPrimitives addObject:fillCircle0096];
    [haul0077.drawPrimitives addObject:fillCircle0097];

    // Добавляем станцию South Station
    MWStation *station0081 = [[MWStation alloc] init];
    station0081.identifier = @"station0081";
    [edge0028.elements addObject:station0081];
    
    station0081.nameOriginal = @"South Station";
    station0081.geoLocation = CGPointMake(42.35261, -71.05536);
    station0081.mapLocation = CGPointMake(2338, 1549);
    station0081.platformIndex = 1;

    MWDrawFillCircle *fillCircle0107 = [[MWDrawFillCircle alloc] init];
    fillCircle0107.center = station0081.mapLocation;
    fillCircle0107.radius = 9.5;
    fillCircle0107.fillColor = [UIColor whiteColor];
    [station0081.drawPrimitives addObject:fillCircle0107];
    
    station0081.showNameOnMap = NO;
    [station0081.nameOriginalTextPrimitives addObject:drawTextLine0012];
    [station0081.nameOriginalTextPrimitives addObject:drawTextLine0013];
    
    // Добавляем вершину
    edge0028.finishVertex = vertex0004;

    ////////////////////////////////////////////////////////////////
    // 7. Silver Line SL4
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Tufts Medical Center - Chinatown
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0029 = [[MWEdge alloc] init];
    edge0029.identifier = @"edge0029";
    edge0029.developmentName = @"Ребро: Tufts Medical Center - Chinatown";
    [self.edges addObject:edge0029];
    
    // Добавляем линию
    edge0029.line = line0007;
    
    // Добавляем вершину
    edge0029.startVertex = vertex0010;

    // Добавляем станцию Tufts Medical Center
    MWStation *station0082 = [[MWStation alloc] init];
    station0082.identifier = @"station0082";
    [edge0029.elements addObject:station0082];
    
    station0082.nameOriginal = @"Tufts Medical Center";
    edge0029.directionFromStation = station0082;
    station0082.geoLocation = CGPointMake(42.3486, -71.0645);
    station0082.mapLocation = CGPointMake(1915, 1701);
    station0082.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0108 = [[MWDrawFillCircle alloc] init];
    fillCircle0108.center = station0082.mapLocation;
    fillCircle0108.radius = 9.5;
    fillCircle0108.fillColor = [UIColor whiteColor];
    [station0082.drawPrimitives addObject:fillCircle0108];

    station0082.showNameOnMap = NO;
    [station0082.nameOriginalTextPrimitives addObject:drawTextLine0042];
    [station0082.nameOriginalTextPrimitives addObject:drawTextLine0043];
    [station0082.nameOriginalTextPrimitives addObject:drawTextLine0044];

    // Добавляем перегон
    MWHaul *haul0078 = [[MWHaul alloc] init];
    haul0078.identifier = @"haul0078";
    haul0078.length = 332;
    [edge0029.elements addObject:haul0078];

    MWDrawLine *drawLine0115 = [[MWDrawLine alloc] init];
    drawLine0115.startPoint = CGPointMake(1915, 1701);
    drawLine0115.endPoint = CGPointMake(1915, 1613);
    drawLine0115.width = 32;
    drawLine0115.color = line0007.color;
    [haul0078.drawPrimitives addObject:drawLine0115];

    MWDrawArc *drawArc0028 = [[MWDrawArc alloc] init];
    drawArc0028.center = CGPointMake(1945, 1613.5);
    drawArc0028.startRadians = 180 * M_PI / 180;
    drawArc0028.endRadians = 225 * M_PI / 180;
    drawArc0028.radius = 30;
    drawArc0028.width = 32;
    drawArc0028.color = line0007.color;
    [haul0078.drawPrimitives addObject:drawArc0028];

    MWDrawLine *drawLine0116 = [[MWDrawLine alloc] init];
    drawLine0116.startPoint = CGPointMake(1923, 1593);
    drawLine0116.endPoint = CGPointMake(1958.5, 1557);
    drawLine0116.width = 32;
    drawLine0116.color = line0007.color;
    [haul0078.drawPrimitives addObject:drawLine0116];

    MWDrawArc *drawArc0029 = [[MWDrawArc alloc] init];
    drawArc0029.center = CGPointMake(1979, 1579);
    drawArc0029.startRadians = 225 * M_PI / 180;
    drawArc0029.endRadians = 270 * M_PI / 180;
    drawArc0029.radius = 30;
    drawArc0029.width = 32;
    drawArc0029.color = line0007.color;
    [haul0078.drawPrimitives addObject:drawArc0029];

    MWDrawLine *drawLine0117 = [[MWDrawLine alloc] init];
    drawLine0117.startPoint = CGPointMake(1979, 1549);
    drawLine0117.endPoint = CGPointMake(2066.5, 1549);
    drawLine0117.width = 32;
    drawLine0117.color = line0007.color;
    [haul0078.drawPrimitives addObject:drawLine0117];
    
    MWDrawTextLine *drawTextLine0085 = [[MWDrawTextLine alloc] init];
    drawTextLine0085.text = @"SL4 &";
    drawTextLine0085.fontName = @"Baskerville";
    drawTextLine0085.fontColor = [UIColor whiteColor];
    drawTextLine0085.fontSize = 20;
    drawTextLine0085.origin = CGPointMake(1915.5, 1585.5);
    drawTextLine0085.kernSpacing = - 0.0;
    drawTextLine0085.degrees = -45;
    [haul0078.drawPrimitives addObject:drawTextLine0085];

    MWDrawTextLine *drawTextLine0086 = [[MWDrawTextLine alloc] init];
    drawTextLine0086.text = @"SL5";
    drawTextLine0086.fontName = @"Baskerville";
    drawTextLine0086.fontColor = [UIColor whiteColor];
    drawTextLine0086.fontSize = 20;
    drawTextLine0086.origin = CGPointMake(1972, 1538);
    drawTextLine0086.kernSpacing = - 0.0;
    [haul0078.drawPrimitives addObject:drawTextLine0086];

    // Добавляем станцию Chinatown
    MWStation *station0083 = [[MWStation alloc] init];
    station0083.identifier = @"station0083";
    [edge0029.elements addObject:station0083];
    
    station0083.nameOriginal = @"Chinatown";
    station0083.geoLocation = CGPointMake(42.3522, -71.0627);
    station0083.mapLocation = CGPointMake(2066.5, 1549);
    station0083.platformIndex = 1;

    MWDrawFillCircle *fillCircle0109 = [[MWDrawFillCircle alloc] init];
    fillCircle0109.center = station0083.mapLocation;
    fillCircle0109.radius = 9.5;
    fillCircle0109.fillColor = [UIColor whiteColor];
    [station0083.drawPrimitives addObject:fillCircle0109];

    station0083.showNameOnMap = NO;
    [station0083.nameOriginalTextPrimitives addObject:drawTextLine0045];
    
    // Добавляем вершину
    edge0029.finishVertex = vertex0011;

    // Создаем участок линии Chinatown - South Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0030 = [[MWEdge alloc] init];
    edge0030.identifier = @"edge0030";
    edge0030.developmentName = @"Ребро: Chinatown - South Station";
    [self.edges addObject:edge0030];
    
    // Добавляем линию
    edge0030.line = line0007;
    
    // Добавляем вершину
    edge0030.startVertex = vertex0011;

    // Добавляем станцию Chinatown
    [edge0030.elements addObject:station0083];
    edge0030.directionFromStation = station0083;

    // Добавляем перегон
    MWHaul *haul0079 = [[MWHaul alloc] init];
    haul0079.identifier = @"haul0079";
    haul0079.length = 803;
    [edge0030.elements addObject:haul0079];

    MWDrawLine *drawLine0118 = [[MWDrawLine alloc] init];
    drawLine0118.startPoint = CGPointMake(2066, 1549);
    drawLine0118.endPoint = CGPointMake(2286, 1549);
    drawLine0118.width = 32;
    drawLine0118.color = line0007.color;
    [haul0079.drawPrimitives addObject:drawLine0118];

    MWDrawTextLine *drawTextLine0087 = [[MWDrawTextLine alloc] init];
    drawTextLine0087.text = @"SL4";
    drawTextLine0087.fontName = @"Baskerville";
    drawTextLine0087.fontColor = [UIColor whiteColor];
    drawTextLine0087.fontSize = 20;
    drawTextLine0087.origin = CGPointMake(2227.5, 1538);
    drawTextLine0087.kernSpacing = - 0.0;
    [haul0079.drawPrimitives addObject:drawTextLine0087];

    // Добавляем станцию South Station
    MWStation *station0084 = [[MWStation alloc] init];
    station0084.identifier = @"station0084";
    [edge0030.elements addObject:station0084];
    
    station0084.nameOriginal = @"South Station";
    station0084.geoLocation = CGPointMake(42.35261, -71.05536);
    station0084.mapLocation = CGPointMake(2286, 1549);

    MWDrawFillCircle *fillCircle0110 = [[MWDrawFillCircle alloc] init];
    fillCircle0110.center = station0084.mapLocation;
    fillCircle0110.radius = 9.5;
    fillCircle0110.fillColor = [UIColor whiteColor];
    [station0084.drawPrimitives addObject:fillCircle0110];
    
    station0084.showNameOnMap = NO;
    [station0084.nameOriginalTextPrimitives addObject:drawTextLine0012];
    [station0084.nameOriginalTextPrimitives addObject:drawTextLine0013];

    // Добавляем вершину
    edge0030.finishVertex = vertex0004;

    // Создаем участок линии South Station - Tufts Medical Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0031 = [[MWEdge alloc] init];
    edge0031.identifier = @"edge0031";
    edge0031.developmentName = @"Ребро: South Station - Tufts Medical Center";
    [self.edges addObject:edge0031];
    
    // Добавляем линию
    edge0031.line = line0007;
    
    // Добавляем вершину
    edge0031.startVertex = vertex0004;

    // Добавляем станцию South Station
    [edge0031.elements addObject:station0084];
    edge0031.directionFromStation = station0084;

    // Добавляем перегон
    MWHaul *haul0080 = [[MWHaul alloc] init];
    haul0080.identifier = @"haul0080";
    haul0080.length = 1202;
    [edge0031.elements addObject:haul0080];

    MWDrawArc *drawArc0030 = [[MWDrawArc alloc] init];
    drawArc0030.center = CGPointMake(2277, 1574.5);
    drawArc0030.startRadians = 270 * M_PI / 180;
    drawArc0030.endRadians = 45 * M_PI / 180;
    drawArc0030.radius = 26;
    drawArc0030.width = 32;
    drawArc0030.color = line0007.color;
    [haul0080.drawPrimitives addObject:drawArc0030];

    MWDrawLine *drawLine0119 = [[MWDrawLine alloc] init];
    drawLine0119.startPoint = CGPointMake(2296, 1592.5);
    drawLine0119.endPoint = CGPointMake(2194, 1694.5);
    drawLine0119.width = 32;
    drawLine0119.color = line0007.color;
    [haul0080.drawPrimitives addObject:drawLine0119];

    MWDrawArc *drawArc0031 = [[MWDrawArc alloc] init];
    drawArc0031.center = CGPointMake(2177, 1675);
    drawArc0031.startRadians = 45 * M_PI / 180;
    drawArc0031.endRadians = 90 * M_PI / 180;
    drawArc0031.radius = 26;
    drawArc0031.width = 32;
    drawArc0031.color = line0007.color;
    [haul0080.drawPrimitives addObject:drawArc0031];

    MWDrawLine *drawLine0120 = [[MWDrawLine alloc] init];
    drawLine0120.startPoint = CGPointMake(1966, 1701);
    drawLine0120.endPoint = CGPointMake(2177, 1701);
    drawLine0120.width = 32;
    drawLine0120.color = line0007.color;
    [haul0080.drawPrimitives addObject:drawLine0120];

    MWDrawTextLine *drawTextLine0088 = [[MWDrawTextLine alloc] init];
    drawTextLine0088.text = @"SL4";
    drawTextLine0088.fontName = @"Baskerville";
    drawTextLine0088.fontColor = [UIColor whiteColor];
    drawTextLine0088.fontSize = 20;
    drawTextLine0088.origin = CGPointMake(2055, 1689.5);
    drawTextLine0088.kernSpacing = 0.4;
    [haul0080.drawPrimitives addObject:drawTextLine0088];

    MWDrawLine *drawLine0121 = [[MWDrawLine alloc] init];
    drawLine0121.startPoint = CGPointMake(1959, 1693);
    drawLine0121.endPoint = CGPointMake(1975, 1709);
    drawLine0121.width = 24;
    drawLine0121.color = line0007.color;
    [haul0080.drawPrimitives addObject:drawLine0121];

    MWDrawLine *drawLine0122 = [[MWDrawLine alloc] init];
    drawLine0122.startPoint = CGPointMake(1958.5, 1701);
    drawLine0122.endPoint = CGPointMake(1971, 1688);
    drawLine0122.width = 2.5;
    drawLine0122.color = [UIColor whiteColor];
    [haul0080.drawPrimitives addObject:drawLine0122];

    MWDrawLine *drawLine0123 = [[MWDrawLine alloc] init];
    drawLine0123.startPoint = CGPointMake(1958.5, 1701);
    drawLine0123.endPoint = CGPointMake(1971, 1714);
    drawLine0123.width = 2.5;
    drawLine0123.color = [UIColor whiteColor];
    [haul0080.drawPrimitives addObject:drawLine0123];

    MWDrawLine *drawLine0124 = [[MWDrawLine alloc] init];
    drawLine0124.startPoint = CGPointMake(1965.5, 1701);
    drawLine0124.endPoint = CGPointMake(1978, 1688);
    drawLine0124.width = 2.5;
    drawLine0124.color = [UIColor whiteColor];
    [haul0080.drawPrimitives addObject:drawLine0124];

    MWDrawLine *drawLine0125 = [[MWDrawLine alloc] init];
    drawLine0125.startPoint = CGPointMake(1965.5, 1701);
    drawLine0125.endPoint = CGPointMake(1978, 1714);
    drawLine0125.width = 2.5;
    drawLine0125.color = [UIColor whiteColor];
    [haul0080.drawPrimitives addObject:drawLine0125];

    // Добавляем станцию Tufts Medical Center
    [edge0031.elements addObject:station0082];

    // Добавляем вершину
    edge0031.finishVertex = vertex0010;

    // Создаем участок линии Tufts Medical Center - Herald St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0032 = [[MWEdge alloc] init];
    edge0032.identifier = @"edge0032";
    edge0032.developmentName = @"Ребро: Tufts Medical Center - Herald St";
    [self.edges addObject:edge0032];
    
    // Добавляем линию
    edge0032.line = line0007;
    
    // Добавляем вершину
    edge0032.startVertex = vertex0010;

    // Добавляем станцию Tufts Medical Center
    [edge0032.elements addObject:station0082];

    // Добавляем перегон
    MWHaul *haul0081 = [[MWHaul alloc] init];
    haul0081.identifier = @"haul0081";
    haul0081.length = 232;
    [edge0032.elements addObject:haul0081];

    MWDrawLine *drawLine0126 = [[MWDrawLine alloc] init];
    drawLine0126.startPoint = CGPointMake(1915, 1701);
    drawLine0126.endPoint = CGPointMake(1915, 1757);
    drawLine0126.width = 32;
    drawLine0126.color = line0007.color;
    [haul0081.drawPrimitives addObject:drawLine0126];

    // Добавляем станцию Herald St
    MWStation *station0085 = [[MWStation alloc] init];
    station0085.identifier = @"station0085";
    [edge0032.elements addObject:station0085];
    
    station0085.nameOriginal = @"Herald Street";
    station0085.geoLocation = CGPointMake(42.3464, -71.0648);
    station0085.mapLocation = CGPointMake(1915, 1757);
    station0085.platformIndex = 1;

    MWDrawFillCircle *fillCircle0111 = [[MWDrawFillCircle alloc] init];
    fillCircle0111.center = station0085.mapLocation;
    fillCircle0111.radius = 9.5;
    fillCircle0111.fillColor = [UIColor whiteColor];
    [station0085.drawPrimitives addObject:fillCircle0111];

    MWDrawTextLine *drawTextLine0089 = [[MWDrawTextLine alloc] init];
    drawTextLine0089.text = @"Herald St";
    drawTextLine0089.fontName = @"Baskerville";
    drawTextLine0089.fontColor = [UIColor blackColor];
    drawTextLine0089.fontSize = 34;
    drawTextLine0089.origin = CGPointMake(1963, 1737);
    drawTextLine0089.kernSpacing = - 2.0;
    [station0085.nameOriginalTextPrimitives addObject:drawTextLine0089];

    // Добавляем вершину
    edge0032.finishVertex = vertex0026;

    // Создаем участок линии Herald St - East Berkeley St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0033 = [[MWEdge alloc] init];
    edge0033.identifier = @"edge0033";
    edge0033.developmentName = @"Ребро: Herald St - East Berkeley St";
    [self.edges addObject:edge0033];
    
    // Добавляем линию
    edge0033.line = line0007;
    
    // Добавляем вершину
    edge0033.startVertex = vertex0026;

    // Добавляем станцию Herald St
    [edge0033.elements addObject:station0085];

    // Добавляем перегон
    MWHaul *haul0082 = [[MWHaul alloc] init];
    haul0082.identifier = @"haul0082";
    haul0082.length = 286;
    [edge0033.elements addObject:haul0082];

    MWDrawLine *drawLine0127 = [[MWDrawLine alloc] init];
    drawLine0127.startPoint = CGPointMake(1915, 1756.5);
    drawLine0127.endPoint = CGPointMake(1915, 1812);
    drawLine0127.width = 32;
    drawLine0127.color = line0007.color;
    [haul0082.drawPrimitives addObject:drawLine0127];

    // Добавляем станцию East Berkeley St
    MWStation *station0086 = [[MWStation alloc] init];
    station0086.identifier = @"station0086";
    [edge0033.elements addObject:station0086];
    
    station0086.nameOriginal = @"East Berkeley Street";
    station0086.geoLocation = CGPointMake(42.344, -71.066);
    station0086.mapLocation = CGPointMake(1915, 1812);
    station0086.platformIndex = 1;

    MWDrawFillCircle *fillCircle0112 = [[MWDrawFillCircle alloc] init];
    fillCircle0112.center = station0086.mapLocation;
    fillCircle0112.radius = 9.5;
    fillCircle0112.fillColor = [UIColor whiteColor];
    [station0086.drawPrimitives addObject:fillCircle0112];
    
    MWDrawTextLine *drawTextLine0090 = [[MWDrawTextLine alloc] init];
    drawTextLine0090.text = @"East Berkeley St";
    drawTextLine0090.fontName = @"Baskerville";
    drawTextLine0090.fontColor = [UIColor blackColor];
    drawTextLine0090.fontSize = 34;
    drawTextLine0090.origin = CGPointMake(1963, 1793);
    drawTextLine0090.kernSpacing = - 1.2;
    [station0086.nameOriginalTextPrimitives addObject:drawTextLine0090];

    // Добавляем вершину
    edge0033.finishVertex = vertex0027;

    // Создаем участок линии East Berkeley St - Union Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0034 = [[MWEdge alloc] init];
    edge0034.identifier = @"edge0034";
    edge0034.developmentName = @"Ребро: East Berkeley St - Union Park St";
    [self.edges addObject:edge0034];
    
    // Добавляем линию
    edge0034.line = line0007;
    
    // Добавляем вершину
    edge0034.startVertex = vertex0027;

    // Добавляем станцию East Berkeley St
    [edge0034.elements addObject:station0086];

    // Добавляем перегон
    MWHaul *haul0083 = [[MWHaul alloc] init];
    haul0083.identifier = @"haul0083";
    haul0083.length = 397;
    [edge0034.elements addObject:haul0083];

    MWDrawLine *drawLine0128 = [[MWDrawLine alloc] init];
    drawLine0128.startPoint = CGPointMake(1915, 1811.5);
    drawLine0128.endPoint = CGPointMake(1915, 1867.5);
    drawLine0128.width = 32;
    drawLine0128.color = line0007.color;
    [haul0083.drawPrimitives addObject:drawLine0128];

    // Добавляем станцию Union Part St
    MWStation *station0087 = [[MWStation alloc] init];
    station0087.identifier = @"station0087";
    [edge0034.elements addObject:station0087];
    
    station0087.nameOriginal = @"Union Park Street";
    station0087.geoLocation = CGPointMake(42.3414, -71.0692);
    station0087.mapLocation = CGPointMake(1915, 1867.5);
    station0087.platformIndex = 1;

    MWDrawFillCircle *fillCircle0113 = [[MWDrawFillCircle alloc] init];
    fillCircle0113.center = station0087.mapLocation;
    fillCircle0113.radius = 9.5;
    fillCircle0113.fillColor = [UIColor whiteColor];
    [station0087.drawPrimitives addObject:fillCircle0113];
    
    MWDrawTextLine *drawTextLine0091 = [[MWDrawTextLine alloc] init];
    drawTextLine0091.text = @"Union Park St";
    drawTextLine0091.fontName = @"Baskerville";
    drawTextLine0091.fontColor = [UIColor blackColor];
    drawTextLine0091.fontSize = 34;
    drawTextLine0091.origin = CGPointMake(1963, 1848);
    drawTextLine0091.kernSpacing = - 1.9;
    [station0087.nameOriginalTextPrimitives addObject:drawTextLine0091];

    // Добавляем вершину
    edge0034.finishVertex = vertex0028;
    
    // Создаем участок линии Union Park St - Newton St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0035 = [[MWEdge alloc] init];
    edge0035.identifier = @"edge0035";
    edge0035.developmentName = @"Ребро: Union Park St - Newton St";
    [self.edges addObject:edge0035];
    
    // Добавляем линию
    edge0035.line = line0007;
    
    // Добавляем вершину
    edge0035.startVertex = vertex0028;

    // Добавляем станцию Union Park St
    [edge0035.elements addObject:station0087];

    // Добавляем перегон
    MWHaul *haul0084 = [[MWHaul alloc] init];
    haul0084.identifier = @"haul0084";
    haul0084.length = 486;
    [edge0035.elements addObject:haul0084];

    MWDrawLine *drawLine0129 = [[MWDrawLine alloc] init];
    drawLine0129.startPoint = CGPointMake(1915, 1867);
    drawLine0129.endPoint = CGPointMake(1915, 1923);
    drawLine0129.width = 32;
    drawLine0129.color = line0007.color;
    [haul0084.drawPrimitives addObject:drawLine0129];

    // Добавляем станцию Newton St
    MWStation *station0088 = [[MWStation alloc] init];
    station0088.identifier = @"station0088";
    [edge0035.elements addObject:station0088];
    
    station0088.nameOriginal = @"Newton Street";
    station0088.geoLocation = CGPointMake(42.3387, -71.0738);
    station0088.mapLocation = CGPointMake(1915, 1923);
    station0088.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0114 = [[MWDrawFillCircle alloc] init];
    fillCircle0114.center = station0088.mapLocation;
    fillCircle0114.radius = 9.5;
    fillCircle0114.fillColor = [UIColor whiteColor];
    [station0088.drawPrimitives addObject:fillCircle0114];
    
    MWDrawTextLine *drawTextLine0092 = [[MWDrawTextLine alloc] init];
    drawTextLine0092.text = @"Newton St";
    drawTextLine0092.fontName = @"Baskerville";
    drawTextLine0092.fontColor = [UIColor blackColor];
    drawTextLine0092.fontSize = 34;
    drawTextLine0092.origin = CGPointMake(1963, 1904);
    drawTextLine0092.kernSpacing = - 1.9;
    [station0088.nameOriginalTextPrimitives addObject:drawTextLine0092];

    // Добавляем вершину
    edge0035.finishVertex = vertex0029;
    
    // Создаем участок линии Newton St - Worcester Sq
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0036 = [[MWEdge alloc] init];
    edge0036.identifier = @"edge0036";
    edge0036.developmentName = @"Ребро: Newton St - Worcester Sq";
    [self.edges addObject:edge0036];
    
    // Добавляем линию
    edge0036.line = line0007;
    
    // Добавляем вершину
    edge0036.startVertex = vertex0029;

    // Добавляем станцию Newton St
    [edge0036.elements addObject:station0088];

    // Добавляем перегон
    MWHaul *haul0085 = [[MWHaul alloc] init];
    haul0085.identifier = @"haul0085";
    haul0085.length = 221;
    [edge0036.elements addObject:haul0085];

    MWDrawLine *drawLine0130 = [[MWDrawLine alloc] init];
    drawLine0130.startPoint = CGPointMake(1915, 1922.5);
    drawLine0130.endPoint = CGPointMake(1915, 1978);
    drawLine0130.width = 32;
    drawLine0130.color = line0007.color;
    [haul0085.drawPrimitives addObject:drawLine0130];

    // Добавляем станцию Worcester Sq
    MWStation *station0089 = [[MWStation alloc] init];
    station0089.identifier = @"station0089";
    [edge0036.elements addObject:station0089];
    
    station0089.nameOriginal = @"Worcester Square";
    station0089.geoLocation = CGPointMake(42.337389, -71.075833);
    station0089.mapLocation = CGPointMake(1915, 1978);
    station0089.platformIndex = 1;

    MWDrawFillCircle *fillCircle0115 = [[MWDrawFillCircle alloc] init];
    fillCircle0115.center = station0089.mapLocation;
    fillCircle0115.radius = 9.5;
    fillCircle0115.fillColor = [UIColor whiteColor];
    [station0089.drawPrimitives addObject:fillCircle0115];
    
    MWDrawTextLine *drawTextLine0093 = [[MWDrawTextLine alloc] init];
    drawTextLine0093.text = @"Worcester Sq";
    drawTextLine0093.fontName = @"Baskerville";
    drawTextLine0093.fontColor = [UIColor blackColor];
    drawTextLine0093.fontSize = 34;
    drawTextLine0093.origin = CGPointMake(1963, 1960);
    drawTextLine0093.kernSpacing = - 1.6;
    [station0089.nameOriginalTextPrimitives addObject:drawTextLine0093];

    // Добавляем вершину
    edge0036.finishVertex = vertex0030;

    // Создаем участок линии Worcester Sq - Mass. Ave
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0037 = [[MWEdge alloc] init];
    edge0037.identifier = @"edge0037";
    edge0037.developmentName = @"Ребро: Worcester Sq - Mass. Ave";
    [self.edges addObject:edge0037];
    
    // Добавляем линию
    edge0037.line = line0007;
    
    // Добавляем вершину
    edge0037.startVertex = vertex0030;

    // Добавляем станцию Worcester Sq
    [edge0037.elements addObject:station0089];

    // Добавляем перегон
    MWHaul *haul0086 = [[MWHaul alloc] init];
    haul0086.identifier = @"haul0086";
    haul0086.length = 163;
    [edge0037.elements addObject:haul0086];

    MWDrawLine *drawLine0131 = [[MWDrawLine alloc] init];
    drawLine0131.startPoint = CGPointMake(1915, 1977.5);
    drawLine0131.endPoint = CGPointMake(1915, 2033.5);
    drawLine0131.width = 32;
    drawLine0131.color = line0007.color;
    [haul0086.drawPrimitives addObject:drawLine0131];

    // Добавляем станцию Mass. Ave
    MWStation *station0090 = [[MWStation alloc] init];
    station0090.identifier = @"station0090";
    [edge0037.elements addObject:station0090];
    
    station0090.nameOriginal = @"Massachusetts Avenue";
    station0090.geoLocation = CGPointMake(42.3363, -71.0772);
    station0090.mapLocation = CGPointMake(1915, 2033.5);
    station0090.platformIndex = 1;

    MWDrawFillCircle *fillCircle0116 = [[MWDrawFillCircle alloc] init];
    fillCircle0116.center = station0090.mapLocation;
    fillCircle0116.radius = 9.5;
    fillCircle0116.fillColor = [UIColor whiteColor];
    [station0090.drawPrimitives addObject:fillCircle0116];

    MWDrawTextLine *drawTextLine0094 = [[MWDrawTextLine alloc] init];
    drawTextLine0094.text = @"Mass. Ave";
    drawTextLine0094.fontName = @"Baskerville";
    drawTextLine0094.fontColor = [UIColor blackColor];
    drawTextLine0094.fontSize = 34;
    drawTextLine0094.origin = CGPointMake(1963, 2011);
    drawTextLine0094.kernSpacing = - 1.3;
    [station0090.nameOriginalTextPrimitives addObject:drawTextLine0094];

    // Добавляем вершину
    edge0037.finishVertex = vertex0031;

    // Создаем участок линии Mass. Ave - Lenox St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0038 = [[MWEdge alloc] init];
    edge0038.identifier = @"edge0038";
    edge0038.developmentName = @"Ребро: Mass. Ave - Lenox St";
    [self.edges addObject:edge0038];
    
    // Добавляем линию
    edge0038.line = line0007;
    
    // Добавляем вершину
    edge0038.startVertex = vertex0031;

    // Добавляем станцию Mass. Ave
    [edge0038.elements addObject:station0090];

    // Добавляем перегон
    MWHaul *haul0087 = [[MWHaul alloc] init];
    haul0087.identifier = @"haul0087";
    haul0087.length = 183;
    [edge0038.elements addObject:haul0087];

    MWDrawLine *drawLine0132 = [[MWDrawLine alloc] init];
    drawLine0132.startPoint = CGPointMake(1915, 2033);
    drawLine0132.endPoint = CGPointMake(1915, 2088.5);
    drawLine0132.width = 32;
    drawLine0132.color = line0007.color;
    [haul0087.drawPrimitives addObject:drawLine0132];

    // Добавляем станцию Lenox St
    MWStation *station0091 = [[MWStation alloc] init];
    station0091.identifier = @"station0091";
    [edge0038.elements addObject:station0091];
    
    station0091.nameOriginal = @"Lenox Street";
    station0091.geoLocation = CGPointMake(42.3351, -71.0788);
    station0091.mapLocation = CGPointMake(1915, 2088.5);
    station0091.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0117 = [[MWDrawFillCircle alloc] init];
    fillCircle0117.center = station0091.mapLocation;
    fillCircle0117.radius = 9.5;
    fillCircle0117.fillColor = [UIColor whiteColor];
    [station0091.drawPrimitives addObject:fillCircle0117];

    MWDrawTextLine *drawTextLine0095 = [[MWDrawTextLine alloc] init];
    drawTextLine0095.text = @"Lenox St";
    drawTextLine0095.fontName = @"Baskerville";
    drawTextLine0095.fontColor = [UIColor blackColor];
    drawTextLine0095.fontSize = 34;
    drawTextLine0095.origin = CGPointMake(1963, 2069);
    drawTextLine0095.kernSpacing = - 1.3;
    [station0091.nameOriginalTextPrimitives addObject:drawTextLine0095];

    // Добавляем вершину
    edge0038.finishVertex = vertex0032;

    // Создаем участок линии Lenox St - Melnea Cass
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0039 = [[MWEdge alloc] init];
    edge0039.identifier = @"edge0039";
    edge0039.developmentName = @"Ребро: Lenox St - Melnea Cass";
    [self.edges addObject:edge0039];
    
    // Добавляем линию
    edge0039.line = line0007;
    
    // Добавляем вершину
    edge0039.startVertex = vertex0032;

    // Добавляем станцию Lenox St
    [edge0039.elements addObject:station0091];

    // Добавляем перегон
    MWHaul *haul0088 = [[MWHaul alloc] init];
    haul0088.identifier = @"haul0088";
    haul0088.length = 311;
    [edge0039.elements addObject:haul0088];

    MWDrawLine *drawLine0133 = [[MWDrawLine alloc] init];
    drawLine0133.startPoint = CGPointMake(1915, 2088);
    drawLine0133.endPoint = CGPointMake(1915, 2144);
    drawLine0133.width = 32;
    drawLine0133.color = line0007.color;
    [haul0088.drawPrimitives addObject:drawLine0133];

    // Добавляем станцию Melnea Cass
    MWStation *station0092 = [[MWStation alloc] init];
    station0092.identifier = @"station0092";
    [edge0039.elements addObject:station0092];
    
    station0092.nameOriginal = @"Melnea Cass Boulevard";
    station0092.geoLocation = CGPointMake(42.3329, -71.081);
    station0092.mapLocation = CGPointMake(1915, 2144);
    station0092.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0118 = [[MWDrawFillCircle alloc] init];
    fillCircle0118.center = station0092.mapLocation;
    fillCircle0118.radius = 9.5;
    fillCircle0118.fillColor = [UIColor whiteColor];
    [station0092.drawPrimitives addObject:fillCircle0118];

    MWDrawTextLine *drawTextLine0096 = [[MWDrawTextLine alloc] init];
    drawTextLine0096.text = @"Melnea Cass";
    drawTextLine0096.fontName = @"Baskerville";
    drawTextLine0096.fontColor = [UIColor blackColor];
    drawTextLine0096.fontSize = 34;
    drawTextLine0096.origin = CGPointMake(1963, 2124);
    drawTextLine0096.kernSpacing = - 2.8;
    [station0092.nameOriginalTextPrimitives addObject:drawTextLine0096];

    // Добавляем вершину
    edge0039.finishVertex = vertex0033;

    // Создаем участок линии Melnea Cass - Dudley Sq
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0040 = [[MWEdge alloc] init];
    edge0040.identifier = @"edge0040";
    edge0040.developmentName = @"Ребро: Melnea Cass - Dudley Sq";
    [self.edges addObject:edge0040];
    
    // Добавляем линию
    edge0040.line = line0007;
    
    // Добавляем вершину
    edge0040.startVertex = vertex0033;

    // Добавляем станцию Melnea Cass
    [edge0040.elements addObject:station0092];

    // Добавляем перегон
    MWHaul *haul0089 = [[MWHaul alloc] init];
    haul0089.identifier = @"haul0089";
    haul0089.length = 535;
    [edge0040.elements addObject:haul0089];

    MWDrawLine *drawLine0134 = [[MWDrawLine alloc] init];
    drawLine0134.startPoint = CGPointMake(1915, 2143.5);
    drawLine0134.endPoint = CGPointMake(1915, 2199);
    drawLine0134.width = 32;
    drawLine0134.color = line0007.color;
    [haul0089.drawPrimitives addObject:drawLine0134];

    // Добавляем станцию Dudley Sq
    MWStation *station0093 = [[MWStation alloc] init];
    station0093.identifier = @"station0093";
    [edge0040.elements addObject:station0093];
    
    station0093.nameOriginal = @"Dudley Square";
    station0093.geoLocation = CGPointMake(42.3292, -71.0842);
    station0093.mapLocation = CGPointMake(1915, 2199);
    station0093.platformIndex = 1;

    MWDrawFillCircle *fillCircle0119 = [[MWDrawFillCircle alloc] init];
    fillCircle0119.center = station0093.mapLocation;
    fillCircle0119.radius = 16;
    fillCircle0119.fillColor = line0007.color;
    [station0093.drawPrimitives addObject:fillCircle0119];

    MWDrawFillCircle *fillCircle0120 = [[MWDrawFillCircle alloc] init];
    fillCircle0120.center = station0093.mapLocation;
    fillCircle0120.radius = 9.5;
    fillCircle0120.fillColor = [UIColor whiteColor];
    [station0093.drawPrimitives addObject:fillCircle0120];

    MWDrawTextLine *drawTextLine0097 = [[MWDrawTextLine alloc] init];
    drawTextLine0097.text = @"DUDLEY SQ";
    drawTextLine0097.fontName = @"Baskerville";
    drawTextLine0097.fontColor = [UIColor blackColor];
    drawTextLine0097.fontSize = 36;
    drawTextLine0097.kernSpacing = - 0.7;
    drawTextLine0097.origin = CGPointMake(1963, 2177);
    [station0093.nameOriginalTextPrimitives addObject:drawTextLine0097];
    
    // Добавляем вершину
    edge0040.finishVertex = vertex0034;

    ////////////////////////////////////////////////////////////////
    // 8. Silver Line SL5
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Tufts Medical Center - Chinatown
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0041 = [[MWEdge alloc] init];
    edge0041.identifier = @"edge0041";
    edge0041.developmentName = @"Ребро: Tufts Medical Center - Chinatown";
    [self.edges addObject:edge0041];
    
    // Добавляем линию
    edge0041.line = line0008;
    
    // Добавляем вершину
    edge0041.startVertex = vertex0010;
    
    // Добавляем станцию Tufts Medical Center
    MWStation *station0094 = [[MWStation alloc] init];
    station0094.identifier = @"station0094";
    [edge0041.elements addObject:station0094];
    
    station0094.nameOriginal = @"Tufts Medical Center";
    edge0041.directionFromStation = station0094;
    station0094.geoLocation = CGPointMake(42.3486, -71.0645);
    station0094.mapLocation = CGPointMake(1915, 1701.5);
    station0094.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0121 = [[MWDrawFillCircle alloc] init];
    fillCircle0121.center = station0094.mapLocation;
    fillCircle0121.radius = 9.5;
    fillCircle0121.fillColor = [UIColor whiteColor];
    [station0094.drawPrimitives addObject:fillCircle0121];
    
    station0094.showNameOnMap = NO;
    [station0094.nameOriginalTextPrimitives addObject:drawTextLine0042];
    [station0094.nameOriginalTextPrimitives addObject:drawTextLine0043];
    [station0094.nameOriginalTextPrimitives addObject:drawTextLine0044];

    // Добавляем перегон
    MWHaul *haul0090 = [[MWHaul alloc] init];
    haul0090.identifier = @"haul0090";
    haul0090.length = 332;
    [edge0041.elements addObject:haul0090];

    haul0090.showOnMap = NO;
    [haul0090.drawPrimitives addObject:drawLine0115];
    [haul0090.drawPrimitives addObject:drawArc0028];
    [haul0090.drawPrimitives addObject:drawLine0116];
    [haul0090.drawPrimitives addObject:drawArc0029];
    [haul0090.drawPrimitives addObject:drawLine0117];
    [haul0090.drawPrimitives addObject:drawTextLine0085];
    [haul0090.drawPrimitives addObject:drawTextLine0086];

    // Добавляем станцию Chinatown
    MWStation *station0095 = [[MWStation alloc] init];
    station0095.identifier = @"station0095";
    [edge0041.elements addObject:station0095];
    
    station0095.nameOriginal = @"Chinatown";
    station0095.geoLocation = CGPointMake(42.3522, -71.0627);
    station0095.mapLocation = CGPointMake(2066.5, 1549);
    station0095.platformIndex = 1;

    MWDrawFillCircle *fillCircle0122 = [[MWDrawFillCircle alloc] init];
    fillCircle0122.center = station0095.mapLocation;
    fillCircle0122.radius = 9.5;
    fillCircle0122.fillColor = [UIColor whiteColor];
    [station0095.drawPrimitives addObject:fillCircle0122];

    station0095.showNameOnMap = NO;
    [station0095.nameOriginalTextPrimitives addObject:drawTextLine0045];
    
    // Добавляем вершину
    edge0041.finishVertex = vertex0011;

    // Создаем участок линии Chinatown - Downtown Crossing
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0042 = [[MWEdge alloc] init];
    edge0042.identifier = @"edge0042";
    edge0042.developmentName = @"Ребро: Chinatown - Downtown Crossing";
    [self.edges addObject:edge0042];
    
    // Добавляем линию
    edge0042.line = line0008;
    
    // Добавляем вершину
    edge0042.startVertex = vertex0011;

    // Добавляем станцию Chinatown
    [edge0042.elements addObject:station0095];
    edge0042.directionFromStation = station0095;
    
    // Добавляем перегон
    MWHaul *haul0091 = [[MWHaul alloc] init];
    haul0091.identifier = @"haul0091";
    haul0091.length = 421;
    [edge0042.elements addObject:haul0091];

    MWDrawArc *drawArc0032 = [[MWDrawArc alloc] init];
    drawArc0032.center = CGPointMake(2172.5, 1519);
    drawArc0032.startRadians = 0 * M_PI / 180;
    drawArc0032.endRadians = 90 * M_PI / 180;
    drawArc0032.radius = 30;
    drawArc0032.width = 40;
    drawArc0032.color = [UIColor whiteColor];
    [haul0091.drawPrimitives addObject:drawArc0032];

    MWDrawLine *drawLine0135 = [[MWDrawLine alloc] init];
    drawLine0135.startPoint = CGPointMake(2066, 1549);
    drawLine0135.endPoint = CGPointMake(2173, 1549);
    drawLine0135.width = 32;
    drawLine0135.color = line0008.color;
    [haul0091.drawPrimitives addObject:drawLine0135];

    MWDrawArc *drawArc0033 = [[MWDrawArc alloc] init];
    drawArc0033.center = CGPointMake(2172.5, 1519);
    drawArc0033.startRadians = 0 * M_PI / 180;
    drawArc0033.endRadians = 90 * M_PI / 180;
    drawArc0033.radius = 30;
    drawArc0033.width = 32;
    drawArc0033.color = line0008.color;
    [haul0091.drawPrimitives addObject:drawArc0033];

    MWDrawLine *drawLine0136 = [[MWDrawLine alloc] init];
    drawLine0136.startPoint = CGPointMake(2202.5, 1519);
    drawLine0136.endPoint = CGPointMake(2202.5, 1461);
    drawLine0136.width = 32;
    drawLine0136.color = line0008.color;
    [haul0091.drawPrimitives addObject:drawLine0136];

    MWDrawTextLine *drawTextLine0098 = [[MWDrawTextLine alloc] init];
    drawTextLine0098.text = @"SL5";
    drawTextLine0098.fontName = @"Baskerville";
    drawTextLine0098.fontColor = [UIColor whiteColor];
    drawTextLine0098.fontSize = 20;
    drawTextLine0098.origin = CGPointMake(2192, 1519);
    drawTextLine0098.kernSpacing = 1.4;
    drawTextLine0098.degrees = -90;
    [haul0091.drawPrimitives addObject:drawTextLine0098];

    MWDrawLine *drawLine0137 = [[MWDrawLine alloc] init];
    drawLine0137.startPoint = CGPointMake(2194.5, 1452.5);
    drawLine0137.endPoint = CGPointMake(2211, 1468);
    drawLine0137.width = 23.5;
    drawLine0137.color = line0008.color;
    [haul0091.drawPrimitives addObject:drawLine0137];

    MWDrawLine *drawLine0138 = [[MWDrawLine alloc] init];
    drawLine0138.startPoint = CGPointMake(2202.5, 1453);
    drawLine0138.endPoint = CGPointMake(2216, 1466);
    drawLine0138.width = 2.5;
    drawLine0138.color = [UIColor whiteColor];
    [haul0091.drawPrimitives addObject:drawLine0138];

    MWDrawLine *drawLine0139 = [[MWDrawLine alloc] init];
    drawLine0139.startPoint = CGPointMake(2203.5, 1453);
    drawLine0139.endPoint = CGPointMake(2189, 1466);
    drawLine0139.width = 2.5;
    drawLine0139.color = [UIColor whiteColor];
    [haul0091.drawPrimitives addObject:drawLine0139];

    MWDrawLine *drawLine0140 = [[MWDrawLine alloc] init];
    drawLine0140.startPoint = CGPointMake(2202.5, 1458);
    drawLine0140.endPoint = CGPointMake(2216, 1471);
    drawLine0140.width = 2.5;
    drawLine0140.color = [UIColor whiteColor];
    [haul0091.drawPrimitives addObject:drawLine0140];
    
    MWDrawLine *drawLine0141 = [[MWDrawLine alloc] init];
    drawLine0141.startPoint = CGPointMake(2203.5, 1458);
    drawLine0141.endPoint = CGPointMake(2189, 1471);
    drawLine0141.width = 2.5;
    drawLine0141.color = [UIColor whiteColor];
    [haul0091.drawPrimitives addObject:drawLine0141];

    // Добавляем станцию Downtown Crossing
    MWStation *station0096 = [[MWStation alloc] init];
    station0096.identifier = @"station0096";
    [edge0042.elements addObject:station0096];
    
    station0096.nameOriginal = @"Downtown Crossing";
    station0096.geoLocation = CGPointMake(42.3555, -71.0605);
    station0096.mapLocation = CGPointMake(2202.5, 1412);

    MWDrawFillCircle *fillCircle0123 = [[MWDrawFillCircle alloc] init];
    fillCircle0123.center = station0096.mapLocation;
    fillCircle0123.radius = 9.5;
    fillCircle0123.fillColor = [UIColor whiteColor];
    [station0096.drawPrimitives addObject:fillCircle0123];

    station0096.showNameOnMap = NO;
    [station0096.nameOriginalTextPrimitives addObject:drawTextLine0010];
    [station0096.nameOriginalTextPrimitives addObject:drawTextLine0011];
    
    // Добавляем вершину
    edge0042.finishVertex = vertex0003;

    // Создаем участок линии Downtown Crossing - Boylston
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0043 = [[MWEdge alloc] init];
    edge0043.identifier = @"edge0043";
    edge0043.developmentName = @"Ребро: Downtown Crossing - Boylston";
    [self.edges addObject:edge0043];
    
    // Добавляем линию
    edge0043.line = line0008;
    
    // Добавляем вершину
    edge0043.startVertex = vertex0003;

    // Добавляем станцию Downtown Crossing
    [edge0043.elements addObject:station0096];
    edge0043.directionFromStation = station0096;
    
    // Добавляем перегон
    MWHaul *haul0092 = [[MWHaul alloc] init];
    haul0092.identifier = @"haul0092";
    haul0092.length = 580;
    [edge0043.elements addObject:haul0092];

    MWDrawLine *drawLine0142 = [[MWDrawLine alloc] init];
    drawLine0142.startPoint = CGPointMake(2202.5, 1412);
    drawLine0142.endPoint = CGPointMake(1974.5, 1411.5);
    drawLine0142.width = 32;
    drawLine0142.color = line0008.color;
    [haul0092.drawPrimitives addObject:drawLine0142];

    MWDrawTextLine *drawTextLine0099 = [[MWDrawTextLine alloc] init];
    drawTextLine0099.text = @"SL5";
    drawTextLine0099.fontName = @"Baskerville";
    drawTextLine0099.fontColor = [UIColor whiteColor];
    drawTextLine0099.fontSize = 20;
    drawTextLine0099.origin = CGPointMake(2059, 1401);
    drawTextLine0099.kernSpacing = 0.2;
    [haul0092.drawPrimitives addObject:drawTextLine0099];
    
    // Добавляем станцию Boylston
    MWStation *station0097 = [[MWStation alloc] init];
    station0097.identifier = @"station0097";
    [edge0043.elements addObject:station0097];
    
    station0097.nameOriginal = @"Boylston";
    station0097.geoLocation = CGPointMake(42.3525, -71.064722);
    station0097.mapLocation = CGPointMake(1974.5, 1411.5);
    
    MWDrawFillCircle *fillCircle0124 = [[MWDrawFillCircle alloc] init];
    fillCircle0124.center = station0097.mapLocation;
    fillCircle0124.radius = 9.5;
    fillCircle0124.fillColor = [UIColor whiteColor];
    [station0097.drawPrimitives addObject:fillCircle0124];

    MWDrawTextLine *drawTextLine0100 = [[MWDrawTextLine alloc] init];
    drawTextLine0100.text = station0097.nameOriginal;
    drawTextLine0100.fontName = @"Baskerville";
    drawTextLine0100.fontColor = [UIColor blackColor];
    drawTextLine0100.fontSize = 34;
    drawTextLine0100.origin = CGPointMake(1797, 1506);
    drawTextLine0100.degrees = -45;
    drawTextLine0100.kernSpacing = - 1.0;
    [station0097.nameOriginalTextPrimitives addObject:drawTextLine0100];

    // Добавляем вершину
    edge0043.finishVertex = vertex0025;

    // Создаем участок линии Boylston - Tufts Medical Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0044 = [[MWEdge alloc] init];
    edge0044.identifier = @"edge0044";
    edge0044.developmentName = @"Ребро: Boylston - Tufts Medical Center";
    [self.edges addObject:edge0044];
    
    // Добавляем линию
    edge0044.line = line0008;
    
    // Добавляем вершину
    edge0044.startVertex = vertex0025;

    // Добавляем станцию Boylston
    [edge0044.elements addObject:station0097];
    edge0044.directionFromStation = station0097;
    
    // Добавляем перегон
    MWHaul *haul0093 = [[MWHaul alloc] init];
    haul0093.identifier = @"haul0093";
    haul0093.length = 529;
    [edge0044.elements addObject:haul0093];

    MWDrawArc *drawArc0034 = [[MWDrawArc alloc] init];
    drawArc0034.center = CGPointMake(1975, 1432);
    drawArc0034.startRadians = 225 * M_PI / 180;
    drawArc0034.endRadians = 270 * M_PI / 180;
    drawArc0034.radius = 20;
    drawArc0034.width = 32;
    drawArc0034.color = line0008.color;
    [haul0093.drawPrimitives addObject:drawArc0034];

    MWDrawLine *drawLine0143 = [[MWDrawLine alloc] init];
    drawLine0143.startPoint = CGPointMake(1961.5, 1417);
    drawLine0143.endPoint = CGPointMake(1926, 1452.5);
    drawLine0143.width = 32;
    drawLine0143.color = line0008.color;
    [haul0093.drawPrimitives addObject:drawLine0143];

    MWDrawArc *drawArc0035 = [[MWDrawArc alloc] init];
    drawArc0035.center = CGPointMake(1955, 1480);
    drawArc0035.startRadians = 180 * M_PI / 180;
    drawArc0035.endRadians = 225 * M_PI / 180;
    drawArc0035.radius = 40;
    drawArc0035.width = 32;
    drawArc0035.color = line0008.color;
    [haul0093.drawPrimitives addObject:drawArc0035];

    MWDrawLine *drawLine0144 = [[MWDrawLine alloc] init];
    drawLine0144.startPoint = CGPointMake(1915, 1480);
    drawLine0144.endPoint = CGPointMake(1915, 1548);
    drawLine0144.width = 32;
    drawLine0144.color = line0008.color;
    [haul0093.drawPrimitives addObject:drawLine0144];

    MWDrawTextLine *drawTextLine0101 = [[MWDrawTextLine alloc] init];
    drawTextLine0101.text = @"SL5";
    drawTextLine0101.fontName = @"Baskerville";
    drawTextLine0101.fontColor = [UIColor whiteColor];
    drawTextLine0101.fontSize = 20;
    drawTextLine0101.origin = CGPointMake(1904.5, 1519);
    drawTextLine0101.kernSpacing = 1.5;
    drawTextLine0101.degrees = -90;
    [haul0093.drawPrimitives addObject:drawTextLine0101];

    MWDrawLine *drawLine0145 = [[MWDrawLine alloc] init];
    drawLine0145.startPoint = CGPointMake(1907, 1556);
    drawLine0145.endPoint = CGPointMake(1923, 1540);
    drawLine0145.width = 22.5;
    drawLine0145.color = line0008.color;
    [haul0093.drawPrimitives addObject:drawLine0145];

    MWDrawLine *drawLine0146 = [[MWDrawLine alloc] init];
    drawLine0146.startPoint = CGPointMake(1915, 1555.5);
    drawLine0146.endPoint = CGPointMake(1902, 1543);
    drawLine0146.width = 2.5;
    drawLine0146.color = [UIColor whiteColor];
    [haul0093.drawPrimitives addObject:drawLine0146];

    MWDrawLine *drawLine0147 = [[MWDrawLine alloc] init];
    drawLine0147.startPoint = CGPointMake(1915, 1555.5);
    drawLine0147.endPoint = CGPointMake(1928, 1543);
    drawLine0147.width = 2.5;
    drawLine0147.color = [UIColor whiteColor];
    [haul0093.drawPrimitives addObject:drawLine0147];

    MWDrawLine *drawLine0148 = [[MWDrawLine alloc] init];
    drawLine0148.startPoint = CGPointMake(1915, 1549);
    drawLine0148.endPoint = CGPointMake(1902, 1536);
    drawLine0148.width = 2.5;
    drawLine0148.color = [UIColor whiteColor];
    [haul0093.drawPrimitives addObject:drawLine0148];

    MWDrawLine *drawLine0149 = [[MWDrawLine alloc] init];
    drawLine0149.startPoint = CGPointMake(1915, 1549);
    drawLine0149.endPoint = CGPointMake(1928, 1536);
    drawLine0149.width = 2.5;
    drawLine0149.color = [UIColor whiteColor];
    [haul0093.drawPrimitives addObject:drawLine0149];

    [haul0093.drawPrimitives addObject:drawLine0115];
    
    // Добавляем станцию Tufts Medical Center
    [edge0044.elements addObject:station0094];

    // Добавляем вершину
    edge0044.finishVertex = vertex0010;

    // Создаем участок линии Tufts Medical Center - Herald St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0045 = [[MWEdge alloc] init];
    edge0045.identifier = @"edge0045";
    edge0045.developmentName = @"Ребро: Tufts Medical Center - Herald St";
    [self.edges addObject:edge0045];
    
    // Добавляем линию
    edge0045.line = line0008;
    
    // Добавляем вершину
    edge0045.startVertex = vertex0010;

    // Добавляем станцию Tufts Medical Center
    [edge0045.elements addObject:station0094];

    // Добавляем перегон
    MWHaul *haul0094 = [[MWHaul alloc] init];
    haul0094.identifier = @"haul0094";
    haul0094.length = 232;
    [edge0045.elements addObject:haul0094];

    haul0094.showOnMap = NO;
    [haul0094.drawPrimitives addObject:drawLine0126];
    
    // Добавляем станцию Herald St
    MWStation *station0098 = [[MWStation alloc] init];
    station0098.identifier = @"station0098";
    [edge0045.elements addObject:station0098];
    
    station0098.nameOriginal = @"Herald Street";
    station0098.geoLocation = CGPointMake(42.3464, -71.0648);
    station0098.mapLocation = CGPointMake(1915, 1757);
    station0098.platformIndex = 1;

    MWDrawFillCircle *fillCircle0125 = [[MWDrawFillCircle alloc] init];
    fillCircle0125.center = station0098.mapLocation;
    fillCircle0125.radius = 9.5;
    fillCircle0125.fillColor = [UIColor whiteColor];
    [station0098.drawPrimitives addObject:fillCircle0125];

    station0098.showNameOnMap = NO;
    [station0098.nameOriginalTextPrimitives addObject:drawTextLine0089];
    
    // Добавляем вершину
    edge0045.finishVertex = vertex0026;

    // Создаем участок линии Herald St - East Berkeley St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0046 = [[MWEdge alloc] init];
    edge0046.identifier = @"edge0046";
    edge0046.developmentName = @"Ребро: Herald St - East Berkeley St";
    [self.edges addObject:edge0046];
    
    // Добавляем линию
    edge0046.line = line0008;
    
    // Добавляем вершину
    edge0046.startVertex = vertex0026;

    // Добавляем станцию Herald St
    [edge0046.elements addObject:station0098];
    
    // Добавляем перегон
    MWHaul *haul0095 = [[MWHaul alloc] init];
    haul0095.identifier = @"haul0095";
    haul0095.length = 286;
    [edge0046.elements addObject:haul0095];

    haul0095.showOnMap = NO;
    [haul0095.drawPrimitives addObject:drawLine0127];
    
    // Добавляем станцию East Berkeley St
    MWStation *station0099 = [[MWStation alloc] init];
    station0099.identifier = @"station0099";
    [edge0046.elements addObject:station0099];
    
    station0099.nameOriginal = @"East Berkeley Street";
    station0099.geoLocation = CGPointMake(42.344, -71.066);
    station0099.mapLocation = CGPointMake(1915, 1812);
    station0099.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0126 = [[MWDrawFillCircle alloc] init];
    fillCircle0126.center = station0099.mapLocation;
    fillCircle0126.radius = 9.5;
    fillCircle0126.fillColor = [UIColor whiteColor];
    [station0099.drawPrimitives addObject:fillCircle0126];

    station0099.showNameOnMap = NO;
    [station0099.nameOriginalTextPrimitives addObject:drawTextLine0090];
    
    // Добавляем вершину
    edge0046.finishVertex = vertex0027;

    // Создаем участок линии East Berkeley St - Union Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0047 = [[MWEdge alloc] init];
    edge0047.identifier = @"edge0047";
    edge0047.developmentName = @"Ребро: East Berkeley St - Union Park St";
    [self.edges addObject:edge0047];
    
    // Добавляем линию
    edge0047.line = line0008;
    
    // Добавляем вершину
    edge0047.startVertex = vertex0027;

    // Добавляем станцию East Berkeley St
    [edge0047.elements addObject:station0099];

    // Добавляем перегон
    MWHaul *haul0096 = [[MWHaul alloc] init];
    haul0096.identifier = @"haul0096";
    haul0096.length = 397;
    [edge0047.elements addObject:haul0096];

    haul0096.showOnMap = NO;
    [haul0096.drawPrimitives addObject:drawLine0128];
    
    // Добавляем станцию Union Park St
    MWStation *station0100 = [[MWStation alloc] init];
    station0100.identifier = @"station0100";
    [edge0047.elements addObject:station0100];
    
    station0100.nameOriginal = @"Union Park Street";
    station0100.geoLocation = CGPointMake(42.3414, -71.0692);
    station0100.mapLocation = CGPointMake(1915, 1867.5);
    station0100.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0127 = [[MWDrawFillCircle alloc] init];
    fillCircle0127.center = station0100.mapLocation;
    fillCircle0127.radius = 9.5;
    fillCircle0127.fillColor = [UIColor whiteColor];
    [station0100.drawPrimitives addObject:fillCircle0127];
    
    station0100.showNameOnMap = NO;
    [station0100.nameOriginalTextPrimitives addObject:drawTextLine0091];
    
    // Добавляем вершину
    edge0047.finishVertex = vertex0028;

    // Создаем участок линии Union Park St - Newton St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0048 = [[MWEdge alloc] init];
    edge0048.identifier = @"edge0048";
    edge0048.developmentName = @"Ребро: Union Park St - Newton St";
    [self.edges addObject:edge0048];
    
    // Добавляем линию
    edge0048.line = line0008;
    
    // Добавляем вершину
    edge0048.startVertex = vertex0028;

    // Добавляем станцию Union Park St
    [edge0048.elements addObject:station0100];

    // Добавляем перегон
    MWHaul *haul0097 = [[MWHaul alloc] init];
    haul0097.identifier = @"haul0097";
    haul0097.length = 486;
    [edge0048.elements addObject:haul0097];

    haul0097.showOnMap = NO;
    [haul0097.drawPrimitives addObject:drawLine0129];
    
    // Добавляем станцию Newton St
    MWStation *station0101 = [[MWStation alloc] init];
    station0101.identifier = @"station0101";
    [edge0048.elements addObject:station0101];
    
    station0101.nameOriginal = @"Newton Street";
    station0101.geoLocation = CGPointMake(42.3387, -71.0738);
    station0101.mapLocation = CGPointMake(1915, 1923);
    station0101.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0128 = [[MWDrawFillCircle alloc] init];
    fillCircle0128.center = station0101.mapLocation;
    fillCircle0128.radius = 9.5;
    fillCircle0128.fillColor = [UIColor whiteColor];
    [station0101.drawPrimitives addObject:fillCircle0128];
    
    station0101.showNameOnMap = NO;
    [station0101.nameOriginalTextPrimitives addObject:drawTextLine0092];
    
    // Добавляем вершину
    edge0048.finishVertex = vertex0029;

    // Создаем участок линии Newton St - Worcester Sq
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0049 = [[MWEdge alloc] init];
    edge0049.identifier = @"edge0049";
    edge0049.developmentName = @"Ребро: Newton St - Worcester Sq";
    [self.edges addObject:edge0049];
    
    // Добавляем линию
    edge0049.line = line0008;
    
    // Добавляем вершину
    edge0049.startVertex = vertex0029;

    // Добавляем станцию Newton St
    [edge0049.elements addObject:station0101];

    // Добавляем перегон
    MWHaul *haul0098 = [[MWHaul alloc] init];
    haul0098.identifier = @"haul0098";
    haul0098.length = 221;
    [edge0049.elements addObject:haul0098];

    haul0098.showOnMap = NO;
    [haul0098.drawPrimitives addObject:drawLine0130];
    
    // Добавляем станцию Worcester Sq
    MWStation *station0102 = [[MWStation alloc] init];
    station0102.identifier = @"station0102";
    [edge0049.elements addObject:station0102];
    
    station0102.nameOriginal = @"Worcester Square";
    station0102.geoLocation = CGPointMake(42.337389, -71.075833);
    station0102.mapLocation = CGPointMake(1915, 1978);
    station0102.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0129 = [[MWDrawFillCircle alloc] init];
    fillCircle0129.center = station0102.mapLocation;
    fillCircle0129.radius = 9.5;
    fillCircle0129.fillColor = [UIColor whiteColor];
    [station0102.drawPrimitives addObject:fillCircle0129];

    station0102.showNameOnMap = NO;
    [station0102.nameOriginalTextPrimitives addObject:drawTextLine0093];
    
    // Добавляем вершину
    edge0049.finishVertex = vertex0030;

    // Создаем участок линии Worcester Sq - Mass. Ave
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0050 = [[MWEdge alloc] init];
    edge0050.identifier = @"edge0050";
    edge0050.developmentName = @"Ребро: Worcester Sq - Mass. Ave";
    [self.edges addObject:edge0050];
    
    // Добавляем линию
    edge0050.line = line0008;
    
    // Добавляем вершину
    edge0050.startVertex = vertex0030;

    // Добавляем станцию Worcester Sq
    [edge0050.elements addObject:station0102];

    // Добавляем перегон
    MWHaul *haul0099 = [[MWHaul alloc] init];
    haul0099.identifier = @"haul0099";
    haul0099.length = 163;
    [edge0050.elements addObject:haul0099];

    haul0099.showOnMap = NO;
    [haul0099.drawPrimitives addObject:drawLine0131];
    
    // Добавляем станцию Mass. Ave
    MWStation *station0103 = [[MWStation alloc] init];
    station0103.identifier = @"station0103";
    [edge0050.elements addObject:station0103];
    
    station0103.nameOriginal = @"Massachusetts Avenue";
    station0103.geoLocation = CGPointMake(42.3363, -71.0772);
    station0103.mapLocation = CGPointMake(1915, 2033.5);
    station0103.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0130 = [[MWDrawFillCircle alloc] init];
    fillCircle0130.center = station0103.mapLocation;
    fillCircle0130.radius = 9.5;
    fillCircle0130.fillColor = [UIColor whiteColor];
    [station0103.drawPrimitives addObject:fillCircle0130];

    station0103.showNameOnMap = NO;
    [station0103.nameOriginalTextPrimitives addObject:drawTextLine0094];
    
    // Добавляем вершину
    edge0050.finishVertex = vertex0031;

    // Создаем участок линии Mass. Ave - Lenox St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0051 = [[MWEdge alloc] init];
    edge0051.identifier = @"edge0051";
    edge0051.developmentName = @"Ребро: Mass. Ave - Lenox St";
    [self.edges addObject:edge0051];
    
    // Добавляем линию
    edge0051.line = line0008;
    
    // Добавляем вершину
    edge0051.startVertex = vertex0031;

    // Добавляем станцию Mass. Ave
    [edge0051.elements addObject:station0103];

    // Добавляем перегон
    MWHaul *haul0100 = [[MWHaul alloc] init];
    haul0100.identifier = @"haul0100";
    haul0100.length = 183;
    [edge0051.elements addObject:haul0100];
    
    haul0100.showOnMap = NO;
    [haul0100.drawPrimitives addObject:drawLine0132];
    
    // Добавляем станцию Lenox St
    MWStation *station0104 = [[MWStation alloc] init];
    station0104.identifier = @"station0104";
    [edge0051.elements addObject:station0104];
    
    station0104.nameOriginal = @"Lenox Street";
    station0104.geoLocation = CGPointMake(42.3351, -71.0788);
    station0104.mapLocation = CGPointMake(1915, 2088.5);
    station0104.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0131 = [[MWDrawFillCircle alloc] init];
    fillCircle0131.center = station0104.mapLocation;
    fillCircle0131.radius = 9.5;
    fillCircle0131.fillColor = [UIColor whiteColor];
    [station0104.drawPrimitives addObject:fillCircle0131];

    station0104.showNameOnMap = NO;
    [station0104.nameOriginalTextPrimitives addObject:drawTextLine0095];
    
    // Добавляем вершину
    edge0051.finishVertex = vertex0032;

    // Создаем участок линии Lenox St - Melnea Cass
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0052 = [[MWEdge alloc] init];
    edge0052.identifier = @"edge0052";
    edge0052.developmentName = @"Ребро: Lenox St - Melnea Cass";
    [self.edges addObject:edge0052];
    
    // Добавляем линию
    edge0052.line = line0008;
    
    // Добавляем вершину
    edge0052.startVertex = vertex0032;

    // Добавляем станцию Lenox St
    [edge0052.elements addObject:station0104];

    // Добавляем перегон
    MWHaul *haul0101 = [[MWHaul alloc] init];
    haul0101.identifier = @"haul0101";
    haul0101.length = 311;
    [edge0052.elements addObject:haul0101];

    haul0101.showOnMap = NO;
    [haul0101.drawPrimitives addObject:drawLine0133];
    
    // Добавляем станцию Melnea Cass
    MWStation *station0105 = [[MWStation alloc] init];
    station0105.identifier = @"station0105";
    [edge0052.elements addObject:station0105];
    
    station0105.nameOriginal = @"Melnea Cass Boulevard";
    station0105.geoLocation = CGPointMake(42.3329, -71.081);
    station0105.mapLocation = CGPointMake(1915, 2144);
    station0105.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0132 = [[MWDrawFillCircle alloc] init];
    fillCircle0132.center = station0105.mapLocation;
    fillCircle0132.radius = 9.5;
    fillCircle0132.fillColor = [UIColor whiteColor];
    [station0105.drawPrimitives addObject:fillCircle0132];

    station0105.showNameOnMap = NO;
    [station0105.nameOriginalTextPrimitives addObject:drawTextLine0096];
    
    // Добавляем вершину
    edge0052.finishVertex = vertex0033;

    // Создаем участок линии Melnea Cass - Dudley Sq
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0053 = [[MWEdge alloc] init];
    edge0053.identifier = @"edge0053";
    edge0053.developmentName = @"Ребро: Melnea Cass - Dudley Sq";
    [self.edges addObject:edge0053];
    
    // Добавляем линию
    edge0053.line = line0008;
    
    // Добавляем вершину
    edge0053.startVertex = vertex0033;

    // Добавляем станцию Melnea Cass
    [edge0053.elements addObject:station0105];

    // Добавляем перегон
    MWHaul *haul0102 = [[MWHaul alloc] init];
    haul0102.identifier = @"haul0102";
    haul0102.length = 535;
    [edge0053.elements addObject:haul0102];

    haul0102.showOnMap = NO;
    [haul0102.drawPrimitives addObject:drawLine0134];
    
    // Добавляем станцию Dudley Sq
    MWStation *station0106 = [[MWStation alloc] init];
    station0106.identifier = @"station0106";
    [edge0053.elements addObject:station0106];
    
    station0106.nameOriginal = @"Dudley Square";
    station0106.geoLocation = CGPointMake(42.3292, -71.0842);
    station0106.mapLocation = CGPointMake(1915, 2199);
    station0106.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0133 = [[MWDrawFillCircle alloc] init];
    fillCircle0133.center = station0106.mapLocation;
    fillCircle0133.radius = 16;
    fillCircle0133.fillColor = line0008.color;
    [station0106.drawPrimitives addObject:fillCircle0133];

    MWDrawFillCircle *fillCircle0134 = [[MWDrawFillCircle alloc] init];
    fillCircle0134.center = station0106.mapLocation;
    fillCircle0134.radius = 9.5;
    fillCircle0134.fillColor = [UIColor whiteColor];
    [station0106.drawPrimitives addObject:fillCircle0134];

    station0106.showNameOnMap = NO;
    [station0106.nameOriginalTextPrimitives addObject:drawTextLine0097];
    
    // Добавляем вершину
    edge0053.finishVertex = vertex0034;

    ////////////////////////////////////////////////////////////////
    // 9. Green Line B
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Boston College - Kenmore
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0054 = [[MWEdge alloc] init];
    edge0054.identifier = @"edge0054";
    edge0054.developmentName = @"Ребро: Boston College - Kenmore";
    [self.edges addObject:edge0054];
    
    // Добавляем линию
    edge0054.line = line0009;
    
    // Добавляем вершину
    edge0054.startVertex = vertex0041;

    // Добавляем станцию Boston College
    MWStation *station0107 = [[MWStation alloc] init];
    station0107.identifier = @"station0107";
    [edge0054.elements addObject:station0107];
    
    station0107.nameOriginal = @"Boston College";
    station0107.geoLocation = CGPointMake(42.340083, -71.167);
    station0107.mapLocation = CGPointMake(395.5, 1418);

    MWDrawFillCircle *fillCircle0135 = [[MWDrawFillCircle alloc] init];
    fillCircle0135.center = station0107.mapLocation;
    fillCircle0135.radius = 16;
    fillCircle0135.fillColor = line0009.color;
    [station0107.drawPrimitives addObject:fillCircle0135];

    MWDrawFillCircle *fillCircle0136 = [[MWDrawFillCircle alloc] init];
    fillCircle0136.center = station0107.mapLocation;
    fillCircle0136.radius = 9.5;
    fillCircle0136.fillColor = [UIColor whiteColor];
    [station0107.drawPrimitives addObject:fillCircle0136];

    MWDrawTextLine *drawTextLine0102 = [[MWDrawTextLine alloc] init];
    drawTextLine0102.text = @"BOSTON";
    drawTextLine0102.fontName = @"Baskerville";
    drawTextLine0102.fontColor = [UIColor blackColor];
    drawTextLine0102.fontSize = 36;
    drawTextLine0102.kernSpacing = - 1.4;
    drawTextLine0102.origin = CGPointMake(189, 1398);
    [station0107.nameOriginalTextPrimitives addObject:drawTextLine0102];

    MWDrawTextLine *drawTextLine0103 = [[MWDrawTextLine alloc] init];
    drawTextLine0103.text = @"COLLEGE";
    drawTextLine0103.fontName = @"Baskerville";
    drawTextLine0103.fontColor = [UIColor blackColor];
    drawTextLine0103.fontSize = 36;
    drawTextLine0103.kernSpacing = - 1.1;
    drawTextLine0103.origin = CGPointMake(167, 1434);
    [station0107.nameOriginalTextPrimitives addObject:drawTextLine0103];

    // Добавляем вершину
    edge0040.finishVertex = vertex0034;

    // Добавляем перегон
    MWHaul *haul0103 = [[MWHaul alloc] init];
    haul0103.identifier = @"haul0103";
    haul0103.length = 793;
    [edge0054.elements addObject:haul0103];

    MWDrawArc *drawArc0036 = [[MWDrawArc alloc] init];
    drawArc0036.center = CGPointMake(395.5, 1338);
    drawArc0036.startRadians = 45 * M_PI / 180;
    drawArc0036.endRadians = 90 * M_PI / 180;
    drawArc0036.radius = 80;
    drawArc0036.width = 32;
    drawArc0036.color = line0009.color;
    [haul0103.drawPrimitives addObject:drawArc0036];

    MWDrawLine *drawLine0150 = [[MWDrawLine alloc] init];
    drawLine0150.startPoint = CGPointMake(451, 1395.5);
    drawLine0150.endPoint = CGPointMake(475, 1374.5);
    drawLine0150.width = 32;
    drawLine0150.color = line0009.color;
    [haul0103.drawPrimitives addObject:drawLine0150];

    // Добавляем станцию South St
    MWStation *station0108 = [[MWStation alloc] init];
    station0108.identifier = @"station0108";
    [edge0054.elements addObject:station0108];
    
    station0108.nameOriginal = @"South Street";
    station0108.geoLocation = CGPointMake(42.339531, -71.157489);
    station0108.mapLocation = CGPointMake(475, 1374.5);

    MWDrawFillCircle *fillCircle0137 = [[MWDrawFillCircle alloc] init];
    fillCircle0137.center = station0108.mapLocation;
    fillCircle0137.radius = 9.5;
    fillCircle0137.fillColor = [UIColor whiteColor];
    [station0108.drawPrimitives addObject:fillCircle0137];
    
    MWDrawTextLine *drawTextLine0104 = [[MWDrawTextLine alloc] init];
    drawTextLine0104.text = @"South St";
    drawTextLine0104.fontName = @"Baskerville";
    drawTextLine0104.fontColor = [UIColor blackColor];
    drawTextLine0104.fontSize = 34;
    drawTextLine0104.origin = CGPointMake(322, 1347);
    drawTextLine0104.kernSpacing = - 2.0;
    [station0108.nameOriginalTextPrimitives addObject:drawTextLine0104];

    // Добавляем перегон
    MWHaul *haul0104 = [[MWHaul alloc] init];
    haul0104.identifier = @"haul0104";
    haul0104.length = 1198;
    [edge0054.elements addObject:haul0104];

    MWDrawLine *drawLine0151 = [[MWDrawLine alloc] init];
    drawLine0151.startPoint = CGPointMake(474, 1375.5);
    drawLine0151.endPoint = CGPointMake(522.5, 1327.5);
    drawLine0151.width = 32;
    drawLine0151.color = line0009.color;
    [haul0104.drawPrimitives addObject:drawLine0151];

    // Добавляем станцию Chestnut Hill Ave
    MWStation *station0109 = [[MWStation alloc] init];
    station0109.identifier = @"station0109";
    [edge0054.elements addObject:station0109];
    
    station0109.nameOriginal = @"Chestnut Hill Avenue";
    station0109.geoLocation = CGPointMake(42.33817, -71.1531);
    station0109.mapLocation = CGPointMake(522.5, 1327.5);
    
    MWDrawFillCircle *fillCircle0138 = [[MWDrawFillCircle alloc] init];
    fillCircle0138.center = station0109.mapLocation;
    fillCircle0138.radius = 9.5;
    fillCircle0138.fillColor = [UIColor whiteColor];
    [station0109.drawPrimitives addObject:fillCircle0138];

    MWDrawTextLine *drawTextLine0105 = [[MWDrawTextLine alloc] init];
    drawTextLine0105.text = @"Chestnut Hill Ave";
    drawTextLine0105.fontName = @"Baskerville";
    drawTextLine0105.fontColor = [UIColor blackColor];
    drawTextLine0105.fontSize = 34;
    drawTextLine0105.origin = CGPointMake(260, 1299);
    drawTextLine0105.kernSpacing = - 1.6;
    [station0109.nameOriginalTextPrimitives addObject:drawTextLine0105];

    // Добавляем перегон
    MWHaul *haul0105 = [[MWHaul alloc] init];
    haul0105.identifier = @"haul0105";
    haul0105.length = 375;
    [edge0054.elements addObject:haul0105];

    MWDrawLine *drawLine0152 = [[MWDrawLine alloc] init];
    drawLine0152.startPoint = CGPointMake(522, 1328);
    drawLine0152.endPoint = CGPointMake(569, 1280.5);
    drawLine0152.width = 32;
    drawLine0152.color = line0009.color;
    [haul0105.drawPrimitives addObject:drawLine0152];

    // Добавляем станцию Chiswick Rd
    MWStation *station0110 = [[MWStation alloc] init];
    station0110.identifier = @"station0110";
    [edge0054.elements addObject:station0110];
    
    station0110.nameOriginal = @"Chiswick Road";
    station0110.geoLocation = CGPointMake(42.340839, -71.150459);
    station0110.mapLocation = CGPointMake(569, 1280.5);

    MWDrawFillCircle *fillCircle0139 = [[MWDrawFillCircle alloc] init];
    fillCircle0139.center = station0110.mapLocation;
    fillCircle0139.radius = 9.5;
    fillCircle0139.fillColor = [UIColor whiteColor];
    [station0110.drawPrimitives addObject:fillCircle0139];

    MWDrawTextLine *drawTextLine0106 = [[MWDrawTextLine alloc] init];
    drawTextLine0106.text = @"Chiswick Rd";
    drawTextLine0106.fontName = @"Baskerville";
    drawTextLine0106.fontColor = [UIColor blackColor];
    drawTextLine0106.fontSize = 34;
    drawTextLine0106.origin = CGPointMake(370, 1250.5);
    drawTextLine0106.kernSpacing = - 1.7;
    [station0110.nameOriginalTextPrimitives addObject:drawTextLine0106];

    // Добавляем перегон
    MWHaul *haul0106 = [[MWHaul alloc] init];
    haul0106.identifier = @"haul0106";
    haul0106.length = 378;
    [edge0054.elements addObject:haul0106];

    MWDrawLine *drawLine0153 = [[MWDrawLine alloc] init];
    drawLine0153.startPoint = CGPointMake(568.5, 1281);
    drawLine0153.endPoint = CGPointMake(616, 1233);
    drawLine0153.width = 32;
    drawLine0153.color = line0009.color;
    [haul0106.drawPrimitives addObject:drawLine0153];

    // Добавляем станцию Sutherland Rd
    MWStation *station0111 = [[MWStation alloc] init];
    station0111.identifier = @"station0111";
    [edge0054.elements addObject:station0111];
    
    station0111.nameOriginal = @"Sutherland Road";
    station0111.geoLocation = CGPointMake(42.341483, -71.146162);
    station0111.mapLocation = CGPointMake(616, 1233);

    MWDrawFillCircle *fillCircle0140 = [[MWDrawFillCircle alloc] init];
    fillCircle0140.center = station0111.mapLocation;
    fillCircle0140.radius = 9.5;
    fillCircle0140.fillColor = [UIColor whiteColor];
    [station0111.drawPrimitives addObject:fillCircle0140];

    MWDrawTextLine *drawTextLine0107 = [[MWDrawTextLine alloc] init];
    drawTextLine0107.text = @"Sutherland Rd";
    drawTextLine0107.fontName = @"Baskerville";
    drawTextLine0107.fontColor = [UIColor blackColor];
    drawTextLine0107.fontSize = 34;
    drawTextLine0107.origin = CGPointMake(390, 1204.5);
    drawTextLine0107.kernSpacing = - 2.3;
    [station0111.nameOriginalTextPrimitives addObject:drawTextLine0107];

    // Добавляем перегон
    MWHaul *haul0107 = [[MWHaul alloc] init];
    haul0107.identifier = @"haul0107";
    haul0107.length = 407;
    [edge0054.elements addObject:haul0107];

    MWDrawLine *drawLine0154 = [[MWDrawLine alloc] init];
    drawLine0154.startPoint = CGPointMake(615.5, 1233.5);
    drawLine0154.endPoint = CGPointMake(663, 1186.5);
    drawLine0154.width = 32;
    drawLine0154.color = line0009.color;
    [haul0107.drawPrimitives addObject:drawLine0154];

    // Добавляем станцию Washington St
    MWStation *station0112 = [[MWStation alloc] init];
    station0112.identifier = @"station0112";
    [edge0054.elements addObject:station0112];
    
    station0112.nameOriginal = @"Washington Street";
    station0112.geoLocation = CGPointMake(42.343886, -71.142593);
    station0112.mapLocation = CGPointMake(663, 1186.5);

    MWDrawFillCircle *fillCircle0141 = [[MWDrawFillCircle alloc] init];
    fillCircle0141.center = station0112.mapLocation;
    fillCircle0141.radius = 9.5;
    fillCircle0141.fillColor = [UIColor whiteColor];
    [station0112.drawPrimitives addObject:fillCircle0141];

    MWDrawTextLine *drawTextLine0108 = [[MWDrawTextLine alloc] init];
    drawTextLine0108.text = @"Washington St";
    drawTextLine0108.fontName = @"Baskerville";
    drawTextLine0108.fontColor = [UIColor blackColor];
    drawTextLine0108.fontSize = 34;
    drawTextLine0108.origin = CGPointMake(410, 1156.5);
    drawTextLine0108.kernSpacing = - 1.8;
    [station0112.nameOriginalTextPrimitives addObject:drawTextLine0108];

    // Добавляем перегон
    MWHaul *haul0108 = [[MWHaul alloc] init];
    haul0108.identifier = @"haul0108";
    haul0108.length = 539;
    [edge0054.elements addObject:haul0108];

    MWDrawLine *drawLine0155 = [[MWDrawLine alloc] init];
    drawLine0155.startPoint = CGPointMake(662.5, 1187);
    drawLine0155.endPoint = CGPointMake(710, 1140);
    drawLine0155.width = 32;
    drawLine0155.color = line0009.color;
    [haul0108.drawPrimitives addObject:drawLine0155];

    // Добавляем станцию Warren St
    MWStation *station0113 = [[MWStation alloc] init];
    station0113.identifier = @"station0113";
    [edge0054.elements addObject:station0113];
    
    station0113.nameOriginal = @"Warren Street";
    station0113.geoLocation = CGPointMake(42.348366, -71.140224);
    station0113.mapLocation = CGPointMake(710, 1140);
    
    MWDrawFillCircle *fillCircle0142 = [[MWDrawFillCircle alloc] init];
    fillCircle0142.center = station0113.mapLocation;
    fillCircle0142.radius = 9.5;
    fillCircle0142.fillColor = [UIColor whiteColor];
    [station0113.drawPrimitives addObject:fillCircle0142];

    MWDrawTextLine *drawTextLine0109 = [[MWDrawTextLine alloc] init];
    drawTextLine0109.text = @"Warren St";
    drawTextLine0109.fontName = @"Baskerville";
    drawTextLine0109.fontColor = [UIColor blackColor];
    drawTextLine0109.fontSize = 34;
    drawTextLine0109.origin = CGPointMake(540, 1110.5);
    drawTextLine0109.kernSpacing = - 2.0;
    [station0113.nameOriginalTextPrimitives addObject:drawTextLine0109];

    // Добавляем перегон
    MWHaul *haul0109 = [[MWHaul alloc] init];
    haul0109.identifier = @"haul0109";
    haul0109.length = 260;
    [edge0054.elements addObject:haul0109];

    MWDrawLine *drawLine0156 = [[MWDrawLine alloc] init];
    drawLine0156.startPoint = CGPointMake(709.5, 1140.5);
    drawLine0156.endPoint = CGPointMake(757, 1092.5);
    drawLine0156.width = 32;
    drawLine0156.color = line0009.color;
    [haul0109.drawPrimitives addObject:drawLine0156];

    // Добавляем станцию Allston St
    MWStation *station0114 = [[MWStation alloc] init];
    station0114.identifier = @"station0114";
    [edge0054.elements addObject:station0114];
    
    station0114.nameOriginal = @"Allston Street";
    station0114.geoLocation = CGPointMake(42.348539, -71.137633);
    station0114.mapLocation = CGPointMake(757, 1092.5);

    MWDrawFillCircle *fillCircle0143 = [[MWDrawFillCircle alloc] init];
    fillCircle0143.center = station0114.mapLocation;
    fillCircle0143.radius = 9.5;
    fillCircle0143.fillColor = [UIColor whiteColor];
    [station0114.drawPrimitives addObject:fillCircle0143];

    MWDrawTextLine *drawTextLine0110 = [[MWDrawTextLine alloc] init];
    drawTextLine0110.text = @"Allston St";
    drawTextLine0110.fontName = @"Baskerville";
    drawTextLine0110.fontColor = [UIColor blackColor];
    drawTextLine0110.fontSize = 34;
    drawTextLine0110.origin = CGPointMake(595, 1064.5);
    drawTextLine0110.kernSpacing = - 1.1;
    [station0114.nameOriginalTextPrimitives addObject:drawTextLine0110];

    // Добавляем перегон
    MWHaul *haul0110 = [[MWHaul alloc] init];
    haul0110.identifier = @"haul0110";
    haul0110.length = 262;
    [edge0054.elements addObject:haul0110];

    MWDrawLine *drawLine0157 = [[MWDrawLine alloc] init];
    drawLine0157.startPoint = CGPointMake(756.5, 1093);
    drawLine0157.endPoint = CGPointMake(805, 1045.5);
    drawLine0157.width = 32;
    drawLine0157.color = line0009.color;
    [haul0110.drawPrimitives addObject:drawLine0157];

    // Добавляем станцию Griggs St
    MWStation *station0115 = [[MWStation alloc] init];
    station0115.identifier = @"station0115";
    [edge0054.elements addObject:station0115];
    
    station0115.nameOriginal = @"Griggs Street / Long Avenue";
    station0115.geoLocation = CGPointMake(42.348542, -71.134551);
    station0115.mapLocation = CGPointMake(805, 1045.5);

    MWDrawFillCircle *fillCircle0144 = [[MWDrawFillCircle alloc] init];
    fillCircle0144.center = station0115.mapLocation;
    fillCircle0144.radius = 9.5;
    fillCircle0144.fillColor = [UIColor whiteColor];
    [station0115.drawPrimitives addObject:fillCircle0144];

    MWDrawTextLine *drawTextLine0111 = [[MWDrawTextLine alloc] init];
    drawTextLine0111.text = @"Griggs St";
    drawTextLine0111.fontName = @"Baskerville";
    drawTextLine0111.fontColor = [UIColor blackColor];
    drawTextLine0111.fontSize = 34;
    drawTextLine0111.origin = CGPointMake(642, 1017);
    drawTextLine0111.kernSpacing = - 1.1;
    [station0115.nameOriginalTextPrimitives addObject:drawTextLine0111];

    // Добавляем перегон
    MWHaul *haul0111 = [[MWHaul alloc] init];
    haul0111.identifier = @"haul0111";
    haul0111.length = 330;
    [edge0054.elements addObject:haul0111];

    MWDrawArc *drawArc0037 = [[MWDrawArc alloc] init];
    drawArc0037.center = CGPointMake(877, 1128.5);
    drawArc0037.startRadians = 228.5 * M_PI / 180;
    drawArc0037.endRadians = 270 * M_PI / 180; // 311.5
    drawArc0037.radius = 110;
    drawArc0037.width = 32;
    drawArc0037.color = line0009.color;
    [haul0111.drawPrimitives addObject:drawArc0037];

    // Добавляем станцию Harvard Ave
    MWStation *station0116 = [[MWStation alloc] init];
    station0116.identifier = @"station0116";
    [edge0054.elements addObject:station0116];
    
    station0116.nameOriginal = @"Harvard Avenue";
    station0116.geoLocation = CGPointMake(42.350118, -71.131197);
    station0116.mapLocation = CGPointMake(878, 1018.5);

    MWDrawFillCircle *fillCircle0145 = [[MWDrawFillCircle alloc] init];
    fillCircle0145.center = station0116.mapLocation;
    fillCircle0145.radius = 9.5;
    fillCircle0145.fillColor = [UIColor whiteColor];
    [station0116.drawPrimitives addObject:fillCircle0145];

    MWDrawTextLine *drawTextLine0112 = [[MWDrawTextLine alloc] init];
    drawTextLine0112.text = @"Harvard Ave";
    drawTextLine0112.fontName = @"Baskerville";
    drawTextLine0112.fontColor = [UIColor blackColor];
    drawTextLine0112.fontSize = 34;
    drawTextLine0112.origin = CGPointMake(672, 964.5);
    drawTextLine0112.kernSpacing = - 2.0;
    [station0116.nameOriginalTextPrimitives addObject:drawTextLine0112];

    // Добавляем перегон
    MWHaul *haul0112 = [[MWHaul alloc] init];
    haul0112.identifier = @"haul0112";
    haul0112.length = 607;
    [edge0054.elements addObject:haul0112];

    MWDrawArc *drawArc0038 = [[MWDrawArc alloc] init];
    drawArc0038.center = CGPointMake(877, 1124.5);
    drawArc0038.startRadians = 269.5 * M_PI / 180;
    drawArc0038.endRadians = 311.5 * M_PI / 180;
    drawArc0038.radius = 106;
    drawArc0038.width = 32;
    drawArc0038.color = line0009.color;
    [haul0112.drawPrimitives addObject:drawArc0038];

    // Добавляем станцию Packards Corner
    MWStation *station0117 = [[MWStation alloc] init];
    station0117.identifier = @"station0117";
    [edge0054.elements addObject:station0117];
    
    station0117.nameOriginal = @"Packards Corner";
    station0117.geoLocation = CGPointMake(42.352086, -71.124722);
    station0117.mapLocation = CGPointMake(947, 1045.5);

    MWDrawFillCircle *fillCircle0146 = [[MWDrawFillCircle alloc] init];
    fillCircle0146.center = station0117.mapLocation;
    fillCircle0146.radius = 9.5;
    fillCircle0146.fillColor = [UIColor whiteColor];
    [station0117.drawPrimitives addObject:fillCircle0146];

    MWDrawTextLine *drawTextLine0113 = [[MWDrawTextLine alloc] init];
    drawTextLine0113.text = station0117.nameOriginal;
    drawTextLine0113.fontName = @"Baskerville";
    drawTextLine0113.fontColor = [UIColor blackColor];
    drawTextLine0113.fontSize = 34;
    drawTextLine0113.origin = CGPointMake(992, 1015);
    drawTextLine0113.kernSpacing = - 2.0;
    [station0117.nameOriginalTextPrimitives addObject:drawTextLine0113];

    // Добавляем перегон
    MWHaul *haul0113 = [[MWHaul alloc] init];
    haul0113.identifier = @"haul0113";
    haul0113.length = 269;
    [edge0054.elements addObject:haul0113];

    MWDrawLine *drawLine0158 = [[MWDrawLine alloc] init];
    drawLine0158.startPoint = CGPointMake(946, 1044);
    drawLine0158.endPoint = CGPointMake(996.5, 1094);
    drawLine0158.width = 32;
    drawLine0158.color = line0009.color;
    [haul0113.drawPrimitives addObject:drawLine0158];

    // Добавляем станцию Babcock St
    MWStation *station0118 = [[MWStation alloc] init];
    station0118.identifier = @"station0118";
    [edge0054.elements addObject:station0118];
    
    station0118.nameOriginal = @"Babcock Street";
    station0118.geoLocation = CGPointMake(42.35169, -71.121547);
    station0118.mapLocation = CGPointMake(996.5, 1094);

    MWDrawFillCircle *fillCircle0147 = [[MWDrawFillCircle alloc] init];
    fillCircle0147.center = station0118.mapLocation;
    fillCircle0147.radius = 9.5;
    fillCircle0147.fillColor = [UIColor whiteColor];
    [station0118.drawPrimitives addObject:fillCircle0147];

    MWDrawTextLine *drawTextLine0114 = [[MWDrawTextLine alloc] init];
    drawTextLine0114.text = @"Babcock St";
    drawTextLine0114.fontName = @"Baskerville";
    drawTextLine0114.fontColor = [UIColor blackColor];
    drawTextLine0114.fontSize = 34;
    drawTextLine0114.origin = CGPointMake(1045, 1067.5);
    drawTextLine0114.kernSpacing = - 1.4;
    [station0118.nameOriginalTextPrimitives addObject:drawTextLine0114];

    // Добавляем перегон
    MWHaul *haul0114 = [[MWHaul alloc] init];
    haul0114.identifier = @"haul0114";
    haul0114.length = 232;
    [edge0054.elements addObject:haul0114];

    MWDrawLine *drawLine0159 = [[MWDrawLine alloc] init];
    drawLine0159.startPoint = CGPointMake(996, 1093.5);
    drawLine0159.endPoint = CGPointMake(1046.5, 1144);
    drawLine0159.width = 32;
    drawLine0159.color = line0009.color;
    [haul0114.drawPrimitives addObject:drawLine0159];

    // Добавляем станцию Pleasant St
    MWStation *station0119 = [[MWStation alloc] init];
    station0119.identifier = @"station0119";
    [edge0054.elements addObject:station0119];
    
    station0119.nameOriginal = @"Pleasant Street";
    station0119.geoLocation = CGPointMake(42.351345, -71.118783);
    station0119.mapLocation = CGPointMake(1046.5, 1144);

    MWDrawFillCircle *fillCircle0148 = [[MWDrawFillCircle alloc] init];
    fillCircle0148.center = station0119.mapLocation;
    fillCircle0148.radius = 9.5;
    fillCircle0148.fillColor = [UIColor whiteColor];
    [station0119.drawPrimitives addObject:fillCircle0148];

    MWDrawTextLine *drawTextLine0115 = [[MWDrawTextLine alloc] init];
    drawTextLine0115.text = @"Pleasant St";
    drawTextLine0115.fontName = @"Baskerville";
    drawTextLine0115.fontColor = [UIColor blackColor];
    drawTextLine0115.fontSize = 34;
    drawTextLine0115.origin = CGPointMake(1093, 1116);
    drawTextLine0115.kernSpacing = - 1.6;
    [station0119.nameOriginalTextPrimitives addObject:drawTextLine0115];

    // Добавляем перегон
    MWHaul *haul0115 = [[MWHaul alloc] init];
    haul0115.identifier = @"haul0115";
    haul0115.length = 232;
    [edge0054.elements addObject:haul0115];

    MWDrawLine *drawLine0160 = [[MWDrawLine alloc] init];
    drawLine0160.startPoint = CGPointMake(1046, 1143.5);
    drawLine0160.endPoint = CGPointMake(1090.5, 1187.5);
    drawLine0160.width = 32;
    drawLine0160.color = line0009.color;
    [haul0115.drawPrimitives addObject:drawLine0160];

    // Добавляем станцию St. Paul St
    MWStation *station0120 = [[MWStation alloc] init];
    station0120.identifier = @"station0120";
    [edge0054.elements addObject:station0120];
    
    station0120.nameOriginal = @"St. Paul Street";
    station0120.geoLocation = CGPointMake(42.350997, -71.115997);
    station0120.mapLocation = CGPointMake(1090.5, 1187.5);

    MWDrawFillCircle *fillCircle0149 = [[MWDrawFillCircle alloc] init];
    fillCircle0149.center = station0120.mapLocation;
    fillCircle0149.radius = 9.5;
    fillCircle0149.fillColor = [UIColor whiteColor];
    [station0120.drawPrimitives addObject:fillCircle0149];

    MWDrawTextLine *drawTextLine0116 = [[MWDrawTextLine alloc] init];
    drawTextLine0116.text = @"St. Paul St";
    drawTextLine0116.fontName = @"Baskerville";
    drawTextLine0116.fontColor = [UIColor blackColor];
    drawTextLine0116.fontSize = 34;
    drawTextLine0116.origin = CGPointMake(1137, 1162);
    drawTextLine0116.kernSpacing = - 1.5;
    [station0120.nameOriginalTextPrimitives addObject:drawTextLine0116];

    // Добавляем перегон
    MWHaul *haul0116 = [[MWHaul alloc] init];
    haul0116.identifier = @"haul0116";
    haul0116.length = 180;
    [edge0054.elements addObject:haul0116];

    MWDrawLine *drawLine0161 = [[MWDrawLine alloc] init];
    drawLine0161.startPoint = CGPointMake(1090, 1187);
    drawLine0161.endPoint = CGPointMake(1140, 1237.5);
    drawLine0161.width = 32;
    drawLine0161.color = line0009.color;
    [haul0116.drawPrimitives addObject:drawLine0161];

    // Добавляем станцию BU West
    MWStation *station0121 = [[MWStation alloc] init];
    station0121.identifier = @"station0121";
    [edge0054.elements addObject:station0121];
    
    station0121.nameOriginal = @"Boston University West";
    station0121.geoLocation = CGPointMake(42.350759, -71.113833);
    station0121.mapLocation = CGPointMake(1140, 1237.5);

    MWDrawFillCircle *fillCircle0150 = [[MWDrawFillCircle alloc] init];
    fillCircle0150.center = station0121.mapLocation;
    fillCircle0150.radius = 9.5;
    fillCircle0150.fillColor = [UIColor whiteColor];
    [station0121.drawPrimitives addObject:fillCircle0150];

    MWDrawTextLine *drawTextLine0117 = [[MWDrawTextLine alloc] init];
    drawTextLine0117.text = @"BU West";
    drawTextLine0117.fontName = @"Baskerville";
    drawTextLine0117.fontColor = [UIColor blackColor];
    drawTextLine0117.fontSize = 34;
    drawTextLine0117.origin = CGPointMake(1187, 1209);
    drawTextLine0117.kernSpacing = - 1.0;
    [station0121.nameOriginalTextPrimitives addObject:drawTextLine0117];

    // Добавляем перегон
    MWHaul *haul0117 = [[MWHaul alloc] init];
    haul0117.identifier = @"haul0117";
    haul0117.length = 591;
    [edge0054.elements addObject:haul0117];

    MWDrawLine *drawLine0162 = [[MWDrawLine alloc] init];
    drawLine0162.startPoint = CGPointMake(1139.5, 1237);
    drawLine0162.endPoint = CGPointMake(1183, 1280.5);
    drawLine0162.width = 32;
    drawLine0162.color = line0009.color;
    [haul0117.drawPrimitives addObject:drawLine0162];

    // Добавляем станцию BU Central
    MWStation *station0122 = [[MWStation alloc] init];
    station0122.identifier = @"station0122";
    [edge0054.elements addObject:station0122];
    
    station0122.nameOriginal = @"Boston University Central";
    station0122.geoLocation = CGPointMake(42.34989, -71.106804);
    station0122.mapLocation = CGPointMake(1183, 1280.5);

    MWDrawFillCircle *fillCircle0151 = [[MWDrawFillCircle alloc] init];
    fillCircle0151.center = station0122.mapLocation;
    fillCircle0151.radius = 9.5;
    fillCircle0151.fillColor = [UIColor whiteColor];
    [station0122.drawPrimitives addObject:fillCircle0151];

    MWDrawTextLine *drawTextLine0118 = [[MWDrawTextLine alloc] init];
    drawTextLine0118.text = @"BU Central";
    drawTextLine0118.fontName = @"Baskerville";
    drawTextLine0118.fontColor = [UIColor blackColor];
    drawTextLine0118.fontSize = 34;
    drawTextLine0118.origin = CGPointMake(1256, 1253);
    drawTextLine0118.kernSpacing = - 2.2;
    [station0122.nameOriginalTextPrimitives addObject:drawTextLine0118];

    // Добавляем перегон
    MWHaul *haul0118 = [[MWHaul alloc] init];
    haul0118.identifier = @"haul0118";
    haul0118.length = 244;
    [edge0054.elements addObject:haul0118];

    MWDrawLine *drawLine0163 = [[MWDrawLine alloc] init];
    drawLine0163.startPoint = CGPointMake(1182.5, 1280);
    drawLine0163.endPoint = CGPointMake(1233, 1330.5);
    drawLine0163.width = 32;
    drawLine0163.color = line0009.color;
    [haul0118.drawPrimitives addObject:drawLine0163];

    // Добавляем станцию BU East
    MWStation *station0123 = [[MWStation alloc] init];
    station0123.identifier = @"station0123";
    [edge0054.elements addObject:station0123];
    
    station0123.nameOriginal = @"Boston University East";
    station0123.geoLocation = CGPointMake(42.349569, -71.103866);
    station0123.mapLocation = CGPointMake(1233, 1330.5);

    MWDrawFillCircle *fillCircle0152 = [[MWDrawFillCircle alloc] init];
    fillCircle0152.center = station0123.mapLocation;
    fillCircle0152.radius = 9.5;
    fillCircle0152.fillColor = [UIColor whiteColor];
    [station0123.drawPrimitives addObject:fillCircle0152];
    
    MWDrawTextLine *drawTextLine0119 = [[MWDrawTextLine alloc] init];
    drawTextLine0119.text = @"BU East";
    drawTextLine0119.fontName = @"Baskerville";
    drawTextLine0119.fontColor = [UIColor blackColor];
    drawTextLine0119.fontSize = 34;
    drawTextLine0119.origin = CGPointMake(1303, 1302);
    drawTextLine0119.kernSpacing = - 1.4;
    [station0123.nameOriginalTextPrimitives addObject:drawTextLine0119];

    // Добавляем перегон
    MWHaul *haul0119 = [[MWHaul alloc] init];
    haul0119.identifier = @"haul0119";
    haul0119.length = 303;
    [edge0054.elements addObject:haul0119];

    MWDrawLine *drawLine0164 = [[MWDrawLine alloc] init];
    drawLine0164.startPoint = CGPointMake(1232.5, 1330);
    drawLine0164.endPoint = CGPointMake(1276.5, 1374);
    drawLine0164.width = 32;
    drawLine0164.color = line0009.color;
    [haul0119.drawPrimitives addObject:drawLine0164];

    // Добавляем станцию Blandford St
    MWStation *station0124 = [[MWStation alloc] init];
    station0124.identifier = @"station0124";
    [edge0054.elements addObject:station0124];
    
    station0124.nameOriginal = @"Blandford Street";
    station0124.geoLocation = CGPointMake(42.349126, -71.100235);
    station0124.mapLocation = CGPointMake(1276.5, 1374);

    MWDrawFillCircle *fillCircle0153 = [[MWDrawFillCircle alloc] init];
    fillCircle0153.center = station0124.mapLocation;
    fillCircle0153.radius = 9.5;
    fillCircle0153.fillColor = [UIColor whiteColor];
    [station0124.drawPrimitives addObject:fillCircle0153];
    
    MWDrawTextLine *drawTextLine0120 = [[MWDrawTextLine alloc] init];
    drawTextLine0120.text = @"Blandford St";
    drawTextLine0120.fontName = @"Baskerville";
    drawTextLine0120.fontColor = [UIColor blackColor];
    drawTextLine0120.fontSize = 34;
    drawTextLine0120.origin = CGPointMake(1321, 1344);
    drawTextLine0120.kernSpacing = - 1.4;
    [station0124.nameOriginalTextPrimitives addObject:drawTextLine0120];

    // Добавляем перегон
    MWHaul *haul0120 = [[MWHaul alloc] init];
    haul0120.identifier = @"haul0120";
    haul0120.length = 379;
    [edge0054.elements addObject:haul0120];

    MWDrawLine *drawLine0165 = [[MWDrawLine alloc] init];
    drawLine0165.startPoint = CGPointMake(1276, 1373.5);
    drawLine0165.endPoint = CGPointMake(1290, 1388);
    drawLine0165.width = 32;
    drawLine0165.color = line0009.color;
    [haul0120.drawPrimitives addObject:drawLine0165];

    MWDrawArc *drawArc0039 = [[MWDrawArc alloc] init];
    drawArc0039.center = CGPointMake(1360, 1316.5);
    drawArc0039.startRadians = 90 * M_PI / 180;
    drawArc0039.endRadians = 135 * M_PI / 180;
    drawArc0039.radius = 100;
    drawArc0039.width = 32;
    drawArc0039.color = line0009.color;
    [haul0120.drawPrimitives addObject:drawArc0039];

    MWDrawLine *drawLine0166 = [[MWDrawLine alloc] init];
    drawLine0166.startPoint = CGPointMake(1360, 1416.5);
    drawLine0166.endPoint = CGPointMake(1362, 1416.5);
    drawLine0166.width = 32;
    drawLine0166.color = line0009.color;
    [haul0120.drawPrimitives addObject:drawLine0166];

    // Добавляем станцию Kenmore
    MWStation *station0125 = [[MWStation alloc] init];
    station0125.identifier = @"station0125";
    [edge0054.elements addObject:station0125];
    
    station0125.nameOriginal = @"Kenmore";
    station0125.geoLocation = CGPointMake(42.348925, -71.095608);
    station0125.mapLocation = CGPointMake(1362, 1416.5);
    station0125.platformIndex = 1;

    MWDrawFillCircle *fillCircle0154 = [[MWDrawFillCircle alloc] init];
    fillCircle0154.center = station0125.mapLocation;
    fillCircle0154.radius = 9.5;
    fillCircle0154.fillColor = [UIColor whiteColor];
    [station0125.drawPrimitives addObject:fillCircle0154];
    
    MWDrawTextLine *drawTextLine0121 = [[MWDrawTextLine alloc] init];
    drawTextLine0121.text = station0125.nameOriginal;
    drawTextLine0121.fontName = @"Baskerville";
    drawTextLine0121.fontColor = [UIColor blackColor];
    drawTextLine0121.fontSize = 34;
    drawTextLine0121.origin = CGPointMake(1236, 1539);
    drawTextLine0121.degrees = -45;
    drawTextLine0121.kernSpacing = - 2.6;
    [station0125.nameOriginalTextPrimitives addObject:drawTextLine0121];

    // Добавляем вершину
    edge0054.finishVertex = vertex0040;

    // Создаем участок линии Kenmore - Hynes Convention Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0055 = [[MWEdge alloc] init];
    edge0055.identifier = @"edge0055";
    edge0055.developmentName = @"Ребро: Kenmore - Hynes Convention Ctr";
    [self.edges addObject:edge0055];
    
    // Добавляем линию
    edge0055.line = line0009;
    
    // Добавляем вершину
    edge0055.startVertex = vertex0040;

    // Добавляем станцию Kenmore
    [edge0055.elements addObject:station0125];

    // Добавляем перегон
    MWHaul *haul0121 = [[MWHaul alloc] init];
    haul0121.identifier = @"haul0121";
    haul0121.length = 709;
    [edge0055.elements addObject:haul0121];

    MWDrawLine *drawLine0167 = [[MWDrawLine alloc] init];
    drawLine0167.startPoint = CGPointMake(1361.5, 1416.5);
    drawLine0167.endPoint = CGPointMake(1501, 1416);
    drawLine0167.width = 32;
    drawLine0167.color = line0009.color;
    [haul0121.drawPrimitives addObject:drawLine0167];
    
    // Добавляем станцию Hynes Convention Ctr
    MWStation *station0126 = [[MWStation alloc] init];
    station0126.identifier = @"station0126";
    [edge0055.elements addObject:station0126];
    
    station0126.nameOriginal = @"Hynes Convention Center";
    station0126.geoLocation = CGPointMake(42.347806, -71.087828);
    station0126.mapLocation = CGPointMake(1501, 1416);
    station0126.platformIndex = 1;

    MWDrawFillCircle *fillCircle0155 = [[MWDrawFillCircle alloc] init];
    fillCircle0155.center = station0126.mapLocation;
    fillCircle0155.radius = 9.5;
    fillCircle0155.fillColor = [UIColor whiteColor];
    [station0126.drawPrimitives addObject:fillCircle0155];
    
    MWDrawTextLine *drawTextLine0122 = [[MWDrawTextLine alloc] init];
    drawTextLine0122.text = @"Hynes Convention Ctr";
    drawTextLine0122.fontName = @"Baskerville";
    drawTextLine0122.fontColor = [UIColor blackColor];
    drawTextLine0122.fontSize = 34;
    drawTextLine0122.origin = CGPointMake(1504, 1372);
    drawTextLine0122.degrees = -45;
    drawTextLine0122.kernSpacing = - 2.0;
    [station0126.nameOriginalTextPrimitives addObject:drawTextLine0122];

    // Добавляем вершину
    edge0055.finishVertex = vertex0039;

    // Создаем участок линии Hynes Convention Ctr - Copley
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0056 = [[MWEdge alloc] init];
    edge0056.identifier = @"edge0056";
    edge0056.developmentName = @"Ребро: Hynes Convention Ctr - Copley";
    [self.edges addObject:edge0056];
    
    // Добавляем линию
    edge0056.line = line0009;
    
    // Добавляем вершину
    edge0056.startVertex = vertex0039;

    // Добавляем станцию Hynes Convention Ctr
    [edge0056.elements addObject:station0126];

    // Добавляем перегон
    MWHaul *haul0122 = [[MWHaul alloc] init];
    haul0122.identifier = @"haul0122";
    haul0122.length = 930;
    [edge0056.elements addObject:haul0122];

    MWDrawLine *drawLine0168 = [[MWDrawLine alloc] init];
    drawLine0168.startPoint = CGPointMake(1500.5, 1416);
    drawLine0168.endPoint = CGPointMake(1639, 1416);
    drawLine0168.width = 32;
    drawLine0168.color = line0009.color;
    [haul0122.drawPrimitives addObject:drawLine0168];

    // Добавляем станцию Copley
    MWStation *station0127 = [[MWStation alloc] init];
    station0127.identifier = @"station0127";
    [edge0056.elements addObject:station0127];
    
    station0127.nameOriginal = @"Copley";
    station0127.geoLocation = CGPointMake(42.350278, -71.0775);
    station0127.mapLocation = CGPointMake(1639, 1416);
    station0127.platformIndex = 1;

    MWDrawFillCircle *fillCircle0156 = [[MWDrawFillCircle alloc] init];
    fillCircle0156.center = station0127.mapLocation;
    fillCircle0156.radius = 9.5;
    fillCircle0156.fillColor = [UIColor whiteColor];
    [station0127.drawPrimitives addObject:fillCircle0156];
    
    MWDrawTextLine *drawTextLine0123 = [[MWDrawTextLine alloc] init];
    drawTextLine0123.text = station0127.nameOriginal;
    drawTextLine0123.fontName = @"Baskerville";
    drawTextLine0123.fontColor = [UIColor blackColor];
    drawTextLine0123.fontSize = 34;
    drawTextLine0123.origin = CGPointMake(1659, 1354);
    drawTextLine0123.degrees = -45;
    drawTextLine0123.kernSpacing = - 2.0;
    [station0127.nameOriginalTextPrimitives addObject:drawTextLine0123];

    // Добавляем вершину
    edge0056.finishVertex = vertex0037;

    // Создаем участок линии Copley - Arlington
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0057 = [[MWEdge alloc] init];
    edge0057.identifier = @"edge0057";
    edge0057.developmentName = @"Ребро: Copley - Arlington";
    [self.edges addObject:edge0057];
    
    // Добавляем линию
    edge0057.line = line0009;
    
    // Добавляем вершину
    edge0057.startVertex = vertex0037;

    // Добавляем станцию Copley
    [edge0057.elements addObject:station0127];

    // Добавляем перегон
    MWHaul *haul0123 = [[MWHaul alloc] init];
    haul0123.identifier = @"haul0123";
    haul0123.length = 590;
    [edge0057.elements addObject:haul0123];

    MWDrawLine *drawLine0169 = [[MWDrawLine alloc] init];
    drawLine0169.startPoint = CGPointMake(1638.5, 1416);
    drawLine0169.endPoint = CGPointMake(1777, 1416);
    drawLine0169.width = 32;
    drawLine0169.color = line0009.color;
    [haul0123.drawPrimitives addObject:drawLine0169];

    // Добавляем станцию Arlington
    MWStation *station0128 = [[MWStation alloc] init];
    station0128.identifier = @"station0128";
    [edge0057.elements addObject:station0128];
    
    station0128.nameOriginal = @"Arlington";
    station0128.geoLocation = CGPointMake(42.35186, -71.070728);
    station0128.mapLocation = CGPointMake(1777, 1416);
    station0128.platformIndex = 1;

    MWDrawFillCircle *fillCircle0157 = [[MWDrawFillCircle alloc] init];
    fillCircle0157.center = station0128.mapLocation;
    fillCircle0157.radius = 9.5;
    fillCircle0157.fillColor = [UIColor whiteColor];
    [station0128.drawPrimitives addObject:fillCircle0157];
    
    MWDrawTextLine *drawTextLine0124 = [[MWDrawTextLine alloc] init];
    drawTextLine0124.text = station0128.nameOriginal;
    drawTextLine0124.fontName = @"Baskerville";
    drawTextLine0124.fontColor = [UIColor blackColor];
    drawTextLine0124.fontSize = 34;
    drawTextLine0124.origin = CGPointMake(1644, 1535);
    drawTextLine0124.degrees = -45;
    drawTextLine0124.kernSpacing = - 1.8;
    [station0128.nameOriginalTextPrimitives addObject:drawTextLine0124];

    // Добавляем вершину
    edge0057.finishVertex = vertex0036;

    // Создаем участок линии Arlington - Boylston
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0058 = [[MWEdge alloc] init];
    edge0058.identifier = @"edge0058";
    edge0058.developmentName = @"Ребро: Arlington - Boylston";
    [self.edges addObject:edge0058];
    
    // Добавляем линию
    edge0058.line = line0009;
    
    // Добавляем вершину
    edge0058.startVertex = vertex0036;

    // Добавляем станцию Arlington
    [edge0058.elements addObject:station0128];

    // Добавляем перегон
    MWHaul *haul0124 = [[MWHaul alloc] init];
    haul0124.identifier = @"haul0124";
    haul0124.length = 502;
    [edge0058.elements addObject:haul0124];

    MWDrawLine *drawLine0170 = [[MWDrawLine alloc] init];
    drawLine0170.startPoint = CGPointMake(1776.5, 1416);
    drawLine0170.endPoint = CGPointMake(1883, 1416);
    drawLine0170.width = 32;
    drawLine0170.color = line0009.color;
    [haul0124.drawPrimitives addObject:drawLine0170];

    MWDrawArc *drawArc0040 = [[MWDrawArc alloc] init];
    drawArc0040.center = CGPointMake(1883, 1316);
    drawArc0040.startRadians = 71.5 * M_PI / 180; // 45
    drawArc0040.endRadians = 90 * M_PI / 180;
    drawArc0040.radius = 100;
    drawArc0040.width = 32;
    drawArc0040.color = line0009.color;
    [haul0124.drawPrimitives addObject:drawArc0040];

    // Добавляем станцию Boylston
    MWStation *station0129 = [[MWStation alloc] init];
    station0129.identifier = @"station0129";
    [edge0058.elements addObject:station0129];
    
    station0129.nameOriginal = @"Boylston";
    station0129.geoLocation = CGPointMake(42.3525, -71.064722);
    station0129.mapLocation = CGPointMake(1915, 1411.5);
    station0129.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0158 = [[MWDrawFillCircle alloc] init];
    fillCircle0158.center = station0129.mapLocation;
    fillCircle0158.radius = 9.5;
    fillCircle0158.fillColor = [UIColor whiteColor];
    [station0129.drawPrimitives addObject:fillCircle0158];
    
    station0129.showNameOnMap = NO;
    [station0129.nameOriginalTextPrimitives addObject:drawTextLine0100];

    // Добавляем вершину
    edge0058.finishVertex = vertex0025;

    // Создаем участок линии Boylston - Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0059 = [[MWEdge alloc] init];
    edge0059.identifier = @"edge0059";
    edge0059.developmentName = @"Ребро: Boylston - Park St";
    [self.edges addObject:edge0059];
    
    // Добавляем линию
    edge0059.line = line0009;
    
    // Добавляем вершину
    edge0059.startVertex = vertex0025;

    // Добавляем станцию Boylston
    [edge0059.elements addObject:station0129];
    
    // Добавляем перегон
    MWHaul *haul0125 = [[MWHaul alloc] init];
    haul0125.identifier = @"haul0125";
    haul0125.length = 487;
    [edge0059.elements addObject:haul0125];

    MWDrawArc *drawArc0041 = [[MWDrawArc alloc] init];
    drawArc0041.center = CGPointMake(1883, 1316);
    drawArc0041.startRadians = 45 * M_PI / 180;
    drawArc0041.endRadians = 72 * M_PI / 180;
    drawArc0041.radius = 100;
    drawArc0041.width = 32;
    drawArc0041.color = line0009.color;
    [haul0125.drawPrimitives addObject:drawArc0041];

    MWDrawLine *drawLine0171 = [[MWDrawLine alloc] init];
    drawLine0171.startPoint = CGPointMake(1953, 1388);
    drawLine0171.endPoint = CGPointMake(2065.5, 1275.5);
    drawLine0171.width = 32;
    drawLine0171.color = line0009.color;
    [haul0125.drawPrimitives addObject:drawLine0171];

    MWDrawTextLine *drawTextLine0139 = [[MWDrawTextLine alloc] init];
    drawTextLine0139.text = @"B, C, D, E";
    drawTextLine0139.fontName = @"Baskerville";
    drawTextLine0139.fontColor = [UIColor whiteColor];
    drawTextLine0139.fontSize = 20;
    drawTextLine0139.origin = CGPointMake(1962, 1362.5);
    drawTextLine0139.kernSpacing = - 0.0;
    drawTextLine0139.degrees = -45;
    [haul0125.drawPrimitives addObject:drawTextLine0139];

    // Добавляем станцию Park St
    MWStation *station0130 = [[MWStation alloc] init];
    station0130.identifier = @"station0130";
    [edge0059.elements addObject:station0130];
    
    station0130.nameOriginal = @"Park Street";
    station0130.geoLocation = CGPointMake(42.356389, -71.0625);
    station0130.mapLocation = CGPointMake(2065.5, 1275.5);
    station0130.platformIndex = 1;

    MWDrawFillCircle *fillCircle0159 = [[MWDrawFillCircle alloc] init];
    fillCircle0159.center = station0130.mapLocation;
    fillCircle0159.radius = 16;
    fillCircle0159.fillColor = line0009.color;
    [station0130.drawPrimitives addObject:fillCircle0159];
    
    MWDrawFillCircle *fillCircle0160 = [[MWDrawFillCircle alloc] init];
    fillCircle0160.center = station0130.mapLocation;
    fillCircle0160.radius = 9.5;
    fillCircle0160.fillColor = [UIColor whiteColor];
    [station0130.drawPrimitives addObject:fillCircle0160];

    station0130.showNameOnMap = NO;
    [station0130.nameOriginalTextPrimitives addObject:drawTextLine0009];
    
    // Добавляем вершину
    edge0059.finishVertex = vertex0002;

    ////////////////////////////////////////////////////////////////
    // 10. Green Line C
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Cleveland Circle - Kenmore
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0060 = [[MWEdge alloc] init];
    edge0060.identifier = @"edge0060";
    edge0060.developmentName = @"Ребро: Cleveland Circle - Kenmore";
    [self.edges addObject:edge0060];
    
    // Добавляем линию
    edge0060.line = line0010;
    
    // Добавляем вершину
    edge0060.startVertex = vertex0042;
    
    // Добавляем станцию Cleveland Circle
    MWStation *station0131 = [[MWStation alloc] init];
    station0131.identifier = @"station0131";
    [edge0060.elements addObject:station0131];
    
    station0131.nameOriginal = @"Cleveland Circle";
    station0131.geoLocation = CGPointMake(42.336217, -71.149006);
    station0131.mapLocation = CGPointMake(461, 1716);

    MWDrawFillCircle *fillCircle0161 = [[MWDrawFillCircle alloc] init];
    fillCircle0161.center = station0131.mapLocation;
    fillCircle0161.radius = 16;
    fillCircle0161.fillColor = line0010.color;
    [station0131.drawPrimitives addObject:fillCircle0161];
    
    MWDrawFillCircle *fillCircle0162 = [[MWDrawFillCircle alloc] init];
    fillCircle0162.center = station0131.mapLocation;
    fillCircle0162.radius = 9.5;
    fillCircle0162.fillColor = [UIColor whiteColor];
    [station0131.drawPrimitives addObject:fillCircle0162];

    MWDrawTextLine *drawTextLine0125 = [[MWDrawTextLine alloc] init];
    drawTextLine0125.text = @"CLEVELAND";
    drawTextLine0125.fontName = @"Baskerville";
    drawTextLine0125.fontColor = [UIColor blackColor];
    drawTextLine0125.fontSize = 36;
    drawTextLine0125.origin = CGPointMake(187, 1695);
    [station0131.nameOriginalTextPrimitives addObject:drawTextLine0125];

    MWDrawTextLine *drawTextLine0126 = [[MWDrawTextLine alloc] init];
    drawTextLine0126.text = @"CIRCLE";
    drawTextLine0126.fontName = @"Baskerville";
    drawTextLine0126.fontColor = [UIColor blackColor];
    drawTextLine0126.fontSize = 36;
    drawTextLine0126.kernSpacing = - 0.6;
    drawTextLine0126.origin = CGPointMake(273, 1731);
    [station0131.nameOriginalTextPrimitives addObject:drawTextLine0126];

    // Добавляем перегон
    MWHaul *haul0126 = [[MWHaul alloc] init];
    haul0126.identifier = @"haul0126";
    haul0126.length = 315;
    [edge0060.elements addObject:haul0126];

    MWDrawArc *drawArc0042 = [[MWDrawArc alloc] init];
    drawArc0042.center = CGPointMake(461, 1636);
    drawArc0042.startRadians = 45 * M_PI / 180;
    drawArc0042.endRadians = 90 * M_PI / 180;
    drawArc0042.radius = 80;
    drawArc0042.width = 32;
    drawArc0042.color = line0010.color;
    [haul0126.drawPrimitives addObject:drawArc0042];

    MWDrawLine *drawLine0172 = [[MWDrawLine alloc] init];
    drawLine0172.startPoint = CGPointMake(516.5, 1693.5);
    drawLine0172.endPoint = CGPointMake(540.5, 1672.5);
    drawLine0172.width = 32;
    drawLine0172.color = line0009.color;
    [haul0126.drawPrimitives addObject:drawLine0172];
    
    // Добавляем станцию Englewood Ave
    MWStation *station0132 = [[MWStation alloc] init];
    station0132.identifier = @"station0132";
    [edge0060.elements addObject:station0132];
    
    station0132.nameOriginal = @"Englewood Avenue";
    station0132.geoLocation = CGPointMake(42.337049, -71.145357);
    station0132.mapLocation = CGPointMake(540.5, 1672.5);

    MWDrawFillCircle *fillCircle0163 = [[MWDrawFillCircle alloc] init];
    fillCircle0163.center = station0132.mapLocation;
    fillCircle0163.radius = 9.5;
    fillCircle0163.fillColor = [UIColor whiteColor];
    [station0132.drawPrimitives addObject:fillCircle0163];

    MWDrawTextLine *drawTextLine0127 = [[MWDrawTextLine alloc] init];
    drawTextLine0127.text = @"Englewood Ave";
    drawTextLine0127.fontName = @"Baskerville";
    drawTextLine0127.fontColor = [UIColor blackColor];
    drawTextLine0127.fontSize = 34;
    drawTextLine0127.origin = CGPointMake(305, 1638.5);
    drawTextLine0127.kernSpacing = - 1.5;
    [station0132.nameOriginalTextPrimitives addObject:drawTextLine0127];

    // Добавляем перегон
    MWHaul *haul0127 = [[MWHaul alloc] init];
    haul0127.identifier = @"haul0127";
    haul0127.length = 327;
    [edge0060.elements addObject:haul0127];

    MWDrawLine *drawLine0173 = [[MWDrawLine alloc] init];
    drawLine0173.startPoint = CGPointMake(539.5, 1673.5);
    drawLine0173.endPoint = CGPointMake(590.5, 1622.5);
    drawLine0173.width = 32;
    drawLine0173.color = line0009.color;
    [haul0127.drawPrimitives addObject:drawLine0173];

    // Добавляем станцию Dean Rd
    MWStation *station0133 = [[MWStation alloc] init];
    station0133.identifier = @"station0133";
    [edge0060.elements addObject:station0133];
    
    station0133.nameOriginal = @"Dean Road";
    station0133.geoLocation = CGPointMake(42.337844, -71.141547);
    station0133.mapLocation = CGPointMake(590.5, 1622.5);

    MWDrawFillCircle *fillCircle0164 = [[MWDrawFillCircle alloc] init];
    fillCircle0164.center = station0133.mapLocation;
    fillCircle0164.radius = 9.5;
    fillCircle0164.fillColor = [UIColor whiteColor];
    [station0133.drawPrimitives addObject:fillCircle0164];

    MWDrawTextLine *drawTextLine0128 = [[MWDrawTextLine alloc] init];
    drawTextLine0128.text = @"Dean Rd";
    drawTextLine0128.fontName = @"Baskerville";
    drawTextLine0128.fontColor = [UIColor blackColor];
    drawTextLine0128.fontSize = 34;
    drawTextLine0128.origin = CGPointMake(435, 1590);
    drawTextLine0128.kernSpacing = - 1.5;
    [station0133.nameOriginalTextPrimitives addObject:drawTextLine0128];

    // Добавляем перегон
    MWHaul *haul0128 = [[MWHaul alloc] init];
    haul0128.identifier = @"haul0128";
    haul0128.length = 244;
    [edge0060.elements addObject:haul0128];

    MWDrawLine *drawLine0174 = [[MWDrawLine alloc] init];
    drawLine0174.startPoint = CGPointMake(590, 1623);
    drawLine0174.endPoint = CGPointMake(640, 1573);
    drawLine0174.width = 32;
    drawLine0174.color = line0009.color;
    [haul0128.drawPrimitives addObject:drawLine0174];

    // Добавляем станцию Tappan St
    MWStation *station0134 = [[MWStation alloc] init];
    station0134.identifier = @"station0134";
    [edge0060.elements addObject:station0134];
    
    station0134.nameOriginal = @"Tappan Street";
    station0134.geoLocation = CGPointMake(42.338469, -71.138705);
    station0134.mapLocation = CGPointMake(640, 1573);

    MWDrawFillCircle *fillCircle0165 = [[MWDrawFillCircle alloc] init];
    fillCircle0165.center = station0134.mapLocation;
    fillCircle0165.radius = 9.5;
    fillCircle0165.fillColor = [UIColor whiteColor];
    [station0134.drawPrimitives addObject:fillCircle0165];

    MWDrawTextLine *drawTextLine0129 = [[MWDrawTextLine alloc] init];
    drawTextLine0129.text = @"Tappan St";
    drawTextLine0129.fontName = @"Baskerville";
    drawTextLine0129.fontColor = [UIColor blackColor];
    drawTextLine0129.fontSize = 34;
    drawTextLine0129.origin = CGPointMake(467, 1542);
    drawTextLine0129.kernSpacing = - 2.3;
    [station0134.nameOriginalTextPrimitives addObject:drawTextLine0129];

    // Добавляем перегон
    MWHaul *haul0129 = [[MWHaul alloc] init];
    haul0129.identifier = @"haul0129";
    haul0129.length = 285;
    [edge0060.elements addObject:haul0129];

    MWDrawLine *drawLine0175 = [[MWDrawLine alloc] init];
    drawLine0175.startPoint = CGPointMake(639.5, 1573.5);
    drawLine0175.endPoint = CGPointMake(690, 1523.5);
    drawLine0175.width = 32;
    drawLine0175.color = line0009.color;
    [haul0129.drawPrimitives addObject:drawLine0175];

    // Добавляем станцию Washington Sq
    MWStation *station0135 = [[MWStation alloc] init];
    station0135.identifier = @"station0135";
    [edge0060.elements addObject:station0135];
    
    station0135.nameOriginal = @"Washington Square";
    station0135.geoLocation = CGPointMake(42.339256, -71.135386);
    station0135.mapLocation = CGPointMake(690, 1523.5);
    
    MWDrawFillCircle *fillCircle0166 = [[MWDrawFillCircle alloc] init];
    fillCircle0166.center = station0135.mapLocation;
    fillCircle0166.radius = 9.5;
    fillCircle0166.fillColor = [UIColor whiteColor];
    [station0135.drawPrimitives addObject:fillCircle0166];

    MWDrawTextLine *drawTextLine0130 = [[MWDrawTextLine alloc] init];
    drawTextLine0130.text = @"Washington Sq";
    drawTextLine0130.fontName = @"Baskerville";
    drawTextLine0130.fontColor = [UIColor blackColor];
    drawTextLine0130.fontSize = 34;
    drawTextLine0130.origin = CGPointMake(428, 1489);
    drawTextLine0130.kernSpacing = - 1.8;
    [station0135.nameOriginalTextPrimitives addObject:drawTextLine0130];

    // Добавляем перегон
    MWHaul *haul0130 = [[MWHaul alloc] init];
    haul0130.identifier = @"haul0130";
    haul0130.length = 348;
    [edge0060.elements addObject:haul0130];

    MWDrawLine *drawLine0176 = [[MWDrawLine alloc] init];
    drawLine0176.startPoint = CGPointMake(689.5, 1523);
    drawLine0176.endPoint = CGPointMake(739.5, 1473.5);
    drawLine0176.width = 32;
    drawLine0176.color = line0009.color;
    [haul0130.drawPrimitives addObject:drawLine0176];

    // Добавляем станцию Fairbanks St
    MWStation *station0136 = [[MWStation alloc] init];
    station0136.identifier = @"station0136";
    [edge0060.elements addObject:station0136];
    
    station0136.nameOriginal = @"Fairbanks";
    station0136.geoLocation = CGPointMake(42.339472, -71.131303);
    station0136.mapLocation = CGPointMake(739.5, 1473.5);

    MWDrawFillCircle *fillCircle0167 = [[MWDrawFillCircle alloc] init];
    fillCircle0167.center = station0136.mapLocation;
    fillCircle0167.radius = 9.5;
    fillCircle0167.fillColor = [UIColor whiteColor];
    [station0136.drawPrimitives addObject:fillCircle0167];

    MWDrawTextLine *drawTextLine0131 = [[MWDrawTextLine alloc] init];
    drawTextLine0131.text = @"Fairbanks St";
    drawTextLine0131.fontName = @"Baskerville";
    drawTextLine0131.fontColor = [UIColor blackColor];
    drawTextLine0131.fontSize = 34;
    drawTextLine0131.origin = CGPointMake(537, 1441);
    drawTextLine0131.kernSpacing = - 1.4;
    [station0136.nameOriginalTextPrimitives addObject:drawTextLine0131];

    // Добавляем перегон
    MWHaul *haul0131 = [[MWHaul alloc] init];
    haul0131.identifier = @"haul0131";
    haul0131.length = 164;
    [edge0060.elements addObject:haul0131];

    MWDrawLine *drawLine0177 = [[MWDrawLine alloc] init];
    drawLine0177.startPoint = CGPointMake(739, 1474);
    drawLine0177.endPoint = CGPointMake(789, 1424);
    drawLine0177.width = 32;
    drawLine0177.color = line0009.color;
    [haul0131.drawPrimitives addObject:drawLine0177];

    // Добавляем станцию Brandon Hall
    MWStation *station0137 = [[MWStation alloc] init];
    station0137.identifier = @"station0137";
    [edge0060.elements addObject:station0137];
    
    station0137.nameOriginal = @"Brandon Hall";
    station0137.geoLocation = CGPointMake(42.339683, -71.129327);
    station0137.mapLocation = CGPointMake(789, 1424);

    MWDrawFillCircle *fillCircle0168 = [[MWDrawFillCircle alloc] init];
    fillCircle0168.center = station0137.mapLocation;
    fillCircle0168.radius = 9.5;
    fillCircle0168.fillColor = [UIColor whiteColor];
    [station0137.drawPrimitives addObject:fillCircle0168];

    MWDrawTextLine *drawTextLine0132 = [[MWDrawTextLine alloc] init];
    drawTextLine0132.text = station0137.nameOriginal;
    drawTextLine0132.fontName = @"Baskerville";
    drawTextLine0132.fontColor = [UIColor blackColor];
    drawTextLine0132.fontSize = 34;
    drawTextLine0132.origin = CGPointMake(585, 1390);
    drawTextLine0132.kernSpacing = - 2.0;
    [station0137.nameOriginalTextPrimitives addObject:drawTextLine0132];

    // Добавляем перегон
    MWHaul *haul0132 = [[MWHaul alloc] init];
    haul0132.identifier = @"haul0132";
    haul0132.length = 372;
    [edge0060.elements addObject:haul0132];

    MWDrawLine *drawLine0178 = [[MWDrawLine alloc] init];
    drawLine0178.startPoint = CGPointMake(788.5, 1424.5);
    drawLine0178.endPoint = CGPointMake(839, 1374);
    drawLine0178.width = 32;
    drawLine0178.color = line0009.color;
    [haul0132.drawPrimitives addObject:drawLine0178];

    // Добавляем станцию Summit Ave
    MWStation *station0138 = [[MWStation alloc] init];
    station0138.identifier = @"station0138";
    [edge0060.elements addObject:station0138];
    
    station0138.nameOriginal = @"Summit Avenue";
    station0138.geoLocation = CGPointMake(42.340946, -71.125182);
    station0138.mapLocation = CGPointMake(839, 1374);

    MWDrawFillCircle *fillCircle0169 = [[MWDrawFillCircle alloc] init];
    fillCircle0169.center = station0138.mapLocation;
    fillCircle0169.radius = 9.5;
    fillCircle0169.fillColor = [UIColor whiteColor];
    [station0138.drawPrimitives addObject:fillCircle0169];
    
    MWDrawTextLine *drawTextLine0133 = [[MWDrawTextLine alloc] init];
    drawTextLine0133.text = @"Summit Ave";
    drawTextLine0133.fontName = @"Baskerville";
    drawTextLine0133.fontColor = [UIColor blackColor];
    drawTextLine0133.fontSize = 34;
    drawTextLine0133.origin = CGPointMake(651, 1342);
    drawTextLine0133.kernSpacing = - 1.8;
    [station0138.nameOriginalTextPrimitives addObject:drawTextLine0133];

    // Добавляем перегон
    MWHaul *haul0133 = [[MWHaul alloc] init];
    haul0133.identifier = @"haul0133";
    haul0133.length = 390;
    [edge0060.elements addObject:haul0133];

    MWDrawLine *drawLine0179 = [[MWDrawLine alloc] init];
    drawLine0179.startPoint = CGPointMake(838.5, 1374.5);
    drawLine0179.endPoint = CGPointMake(878, 1334.5);
    drawLine0179.width = 32;
    drawLine0179.color = line0009.color;
    [haul0133.drawPrimitives addObject:drawLine0179];

    // Добавляем станцию Coolidge Corner
    MWStation *station0139 = [[MWStation alloc] init];
    station0139.identifier = @"station0139";
    [edge0060.elements addObject:station0139];
    
    station0139.nameOriginal = @"Coolidge Corner";
    station0139.geoLocation = CGPointMake(42.342226, -71.120888);
    station0139.mapLocation = CGPointMake(878, 1334.5);

    MWDrawFillCircle *fillCircle0170 = [[MWDrawFillCircle alloc] init];
    fillCircle0170.center = station0139.mapLocation;
    fillCircle0170.radius = 9.5;
    fillCircle0170.fillColor = [UIColor whiteColor];
    [station0139.drawPrimitives addObject:fillCircle0170];
    
    MWDrawTextLine *drawTextLine0134 = [[MWDrawTextLine alloc] init];
    drawTextLine0134.text = station0139.nameOriginal;
    drawTextLine0134.fontName = @"Baskerville";
    drawTextLine0134.fontColor = [UIColor blackColor];
    drawTextLine0134.fontSize = 34;
    drawTextLine0134.origin = CGPointMake(611, 1291);
    drawTextLine0134.kernSpacing = - 2.0;
    [station0139.nameOriginalTextPrimitives addObject:drawTextLine0134];

    // Добавляем перегон
    MWHaul *haul0134 = [[MWHaul alloc] init];
    haul0134.identifier = @"haul0134";
    haul0134.length = 362;
    [edge0060.elements addObject:haul0134];

    MWDrawLine *drawLine0180 = [[MWDrawLine alloc] init];
    drawLine0180.startPoint = CGPointMake(877.5, 1335);
    drawLine0180.endPoint = CGPointMake(930.5, 1282.5);
    drawLine0180.width = 32;
    drawLine0180.color = line0009.color;
    [haul0134.drawPrimitives addObject:drawLine0180];

    // Добавляем станцию St. Paul St
    MWStation *station0140 = [[MWStation alloc] init];
    station0140.identifier = @"station0140";
    [edge0060.elements addObject:station0140];
    
    station0140.nameOriginal = @"St. Paul Street";
    station0140.geoLocation = CGPointMake(42.343366, -71.116759);
    station0140.mapLocation = CGPointMake(930.5, 1282.5);

    MWDrawFillCircle *fillCircle0171 = [[MWDrawFillCircle alloc] init];
    fillCircle0171.center = station0140.mapLocation;
    fillCircle0171.radius = 9.5;
    fillCircle0171.fillColor = [UIColor whiteColor];
    [station0140.drawPrimitives addObject:fillCircle0171];

    MWDrawTextLine *drawTextLine0135 = [[MWDrawTextLine alloc] init];
    drawTextLine0135.text = @"St. Paul St";
    drawTextLine0135.fontName = @"Baskerville";
    drawTextLine0135.fontColor = [UIColor blackColor];
    drawTextLine0135.fontSize = 34;
    drawTextLine0135.origin = CGPointMake(759, 1246);
    drawTextLine0135.kernSpacing = - 1.5;
    [station0140.nameOriginalTextPrimitives addObject:drawTextLine0135];

    // Добавляем перегон
    MWHaul *haul0135 = [[MWHaul alloc] init];
    haul0135.identifier = @"haul0135";
    haul0135.length = 254;
    [edge0060.elements addObject:haul0135];

    MWDrawLine *drawLine0181 = [[MWDrawLine alloc] init];
    drawLine0181.startPoint = CGPointMake(930, 1283);
    drawLine0181.endPoint = CGPointMake(949.5, 1264.5);
    drawLine0181.width = 32;
    drawLine0181.color = line0009.color;
    [haul0135.drawPrimitives addObject:drawLine0181];

    MWDrawArc *drawArc0043 = [[MWDrawArc alloc] init];
    drawArc0043.center = CGPointMake(1005, 1322);
    drawArc0043.startRadians = 225 * M_PI / 180;
    drawArc0043.endRadians = 315 * M_PI / 180;
    drawArc0043.radius = 80;
    drawArc0043.width = 32;
    drawArc0043.color = line0009.color;
    [haul0135.drawPrimitives addObject:drawArc0043];

    MWDrawLine *drawLine0182 = [[MWDrawLine alloc] init];
    drawLine0182.startPoint = CGPointMake(1061, 1265);
    drawLine0182.endPoint = CGPointMake(1089, 1292);
    drawLine0182.width = 32;
    drawLine0182.color = line0009.color;
    [haul0135.drawPrimitives addObject:drawLine0182];

    // Добавляем станцию Kent St
    MWStation *station0141 = [[MWStation alloc] init];
    station0141.identifier = @"station0141";
    [edge0060.elements addObject:station0141];
    
    station0141.nameOriginal = @"Kent Street";
    station0141.geoLocation = CGPointMake(42.344125, -71.113885);
    station0141.mapLocation = CGPointMake(1089, 1292);

    MWDrawFillCircle *fillCircle0172 = [[MWDrawFillCircle alloc] init];
    fillCircle0172.center = station0141.mapLocation;
    fillCircle0172.radius = 9.5;
    fillCircle0172.fillColor = [UIColor whiteColor];
    [station0141.drawPrimitives addObject:fillCircle0172];

    MWDrawTextLine *drawTextLine0136 = [[MWDrawTextLine alloc] init];
    drawTextLine0136.text = @"Kent St";
    drawTextLine0136.fontName = @"Baskerville";
    drawTextLine0136.fontColor = [UIColor blackColor];
    drawTextLine0136.fontSize = 34;
    drawTextLine0136.origin = CGPointMake(959, 1274.5);
    drawTextLine0136.kernSpacing = - 2.2;
    [station0141.nameOriginalTextPrimitives addObject:drawTextLine0136];

    // Добавляем перегон
    MWHaul *haul0136 = [[MWHaul alloc] init];
    haul0136.identifier = @"haul0136";
    haul0136.length = 244;
    [edge0060.elements addObject:haul0136];

    MWDrawLine *drawLine0183 = [[MWDrawLine alloc] init];
    drawLine0183.startPoint = CGPointMake(1088.5, 1291.5);
    drawLine0183.endPoint = CGPointMake(1138.5, 1341.5);
    drawLine0183.width = 32;
    drawLine0183.color = line0009.color;
    [haul0136.drawPrimitives addObject:drawLine0183];

    // Добавляем станцию Hawes St
    MWStation *station0142 = [[MWStation alloc] init];
    station0142.identifier = @"station0142";
    [edge0060.elements addObject:station0142];
    
    station0142.nameOriginal = @"Hawes Street";
    station0142.geoLocation = CGPointMake(42.34487, -71.111129);
    station0142.mapLocation = CGPointMake(1138.5, 1341.5);

    MWDrawFillCircle *fillCircle0173 = [[MWDrawFillCircle alloc] init];
    fillCircle0173.center = station0142.mapLocation;
    fillCircle0173.radius = 9.5;
    fillCircle0173.fillColor = [UIColor whiteColor];
    [station0142.drawPrimitives addObject:fillCircle0173];

    MWDrawTextLine *drawTextLine0137 = [[MWDrawTextLine alloc] init];
    drawTextLine0137.text = @"Hawes St";
    drawTextLine0137.fontName = @"Baskerville";
    drawTextLine0137.fontColor = [UIColor blackColor];
    drawTextLine0137.fontSize = 34;
    drawTextLine0137.origin = CGPointMake(967, 1321);
    drawTextLine0137.kernSpacing = - 1.4;
    [station0142.nameOriginalTextPrimitives addObject:drawTextLine0137];

    // Добавляем перегон
    MWHaul *haul0137 = [[MWHaul alloc] init];
    haul0137.identifier = @"haul0137";
    haul0137.length = 332;
    [edge0060.elements addObject:haul0137];

    MWDrawLine *drawLine0184 = [[MWDrawLine alloc] init];
    drawLine0184.startPoint = CGPointMake(1138, 1341);
    drawLine0184.endPoint = CGPointMake(1182, 1385.5);
    drawLine0184.width = 32;
    drawLine0184.color = line0009.color;
    [haul0137.drawPrimitives addObject:drawLine0184];

    // Добавляем станцию St. Marys St
    MWStation *station0143 = [[MWStation alloc] init];
    station0143.identifier = @"station0143";
    [edge0060.elements addObject:station0143];
    
    station0143.nameOriginal = @"St. Marys Street";
    station0143.geoLocation = CGPointMake(42.345944, -71.107383);
    station0143.mapLocation = CGPointMake(1182, 1385.5);
    
    MWDrawFillCircle *fillCircle0174 = [[MWDrawFillCircle alloc] init];
    fillCircle0174.center = station0143.mapLocation;
    fillCircle0174.radius = 9.5;
    fillCircle0174.fillColor = [UIColor whiteColor];
    [station0143.drawPrimitives addObject:fillCircle0174];
    
    MWDrawTextLine *drawTextLine0138 = [[MWDrawTextLine alloc] init];
    drawTextLine0138.text = @"St. Marys St";
    drawTextLine0138.fontName = @"Baskerville";
    drawTextLine0138.fontColor = [UIColor blackColor];
    drawTextLine0138.fontSize = 34;
    drawTextLine0138.origin = CGPointMake(948, 1366);
    drawTextLine0138.kernSpacing = - 1.6;
    [station0143.nameOriginalTextPrimitives addObject:drawTextLine0138];

    // Добавляем перегон
    MWHaul *haul0138 = [[MWHaul alloc] init];
    haul0138.identifier = @"haul0138";
    haul0138.length = 1030;
    [edge0060.elements addObject:haul0138];

    MWDrawLine *drawLine0185 = [[MWDrawLine alloc] init];
    drawLine0185.startPoint = CGPointMake(1181.5, 1385);
    drawLine0185.endPoint = CGPointMake(1184.5, 1388);
    drawLine0185.width = 32;
    drawLine0185.color = line0009.color;
    [haul0138.drawPrimitives addObject:drawLine0185];

    MWDrawArc *drawArc0044 = [[MWDrawArc alloc] init];
    drawArc0044.center = CGPointMake(1254.5, 1316.5);
    drawArc0044.startRadians = 90 * M_PI / 180;
    drawArc0044.endRadians = 135 * M_PI / 180;
    drawArc0044.radius = 100;
    drawArc0044.width = 32;
    drawArc0044.color = line0009.color;
    [haul0138.drawPrimitives addObject:drawArc0044];

    MWDrawLine *drawLine0186 = [[MWDrawLine alloc] init];
    drawLine0186.startPoint = CGPointMake(1254, 1416.5);
    drawLine0186.endPoint = CGPointMake(1362, 1416.5);
    drawLine0186.width = 32;
    drawLine0186.color = line0009.color;
    [haul0138.drawPrimitives addObject:drawLine0186];

    // Добавляем станцию Kenmore
    MWStation *station0144 = [[MWStation alloc] init];
    station0144.identifier = @"station0144";
    [edge0060.elements addObject:station0144];
    
    station0144.nameOriginal = @"Kenmore";
    station0144.geoLocation = CGPointMake(42.348925, -71.095608);
    station0144.mapLocation = CGPointMake(1362, 1416.5);
    station0144.platformIndex = 1;

    MWDrawFillCircle *fillCircle0175 = [[MWDrawFillCircle alloc] init];
    fillCircle0175.center = station0144.mapLocation;
    fillCircle0175.radius = 9.5;
    fillCircle0175.fillColor = [UIColor whiteColor];
    [station0144.drawPrimitives addObject:fillCircle0175];

    station0144.showNameOnMap = NO;
    [station0144.nameOriginalTextPrimitives addObject:drawTextLine0121];
    
    // Добавляем вершину
    edge0060.finishVertex = vertex0040;

    // Создаем участок линии Kenmore - Hynes Convention Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0061 = [[MWEdge alloc] init];
    edge0061.identifier = @"edge0061";
    edge0061.developmentName = @"Ребро: Kenmore - Hynes Convention Ctr";
    [self.edges addObject:edge0061];
    
    // Добавляем линию
    edge0061.line = line0010;
    
    // Добавляем вершину
    edge0061.startVertex = vertex0040;

    // Добавляем станцию Kenmore
    [edge0061.elements addObject:station0144];

    // Добавляем перегон
    MWHaul *haul0139 = [[MWHaul alloc] init];
    haul0139.identifier = @"haul0139";
    haul0139.length = 709;
    [edge0061.elements addObject:haul0139];

    haul0139.showOnMap = NO;
    [haul0139.drawPrimitives addObject:drawLine0167];
    
    // Добавляем станцию Hynes Convention Ctr
    MWStation *station0145 = [[MWStation alloc] init];
    station0145.identifier = @"station0145";
    [edge0061.elements addObject:station0145];
    
    station0145.nameOriginal = @"Hynes Convention Center";
    station0145.geoLocation = CGPointMake(42.347806, -71.087828);
    station0145.mapLocation = CGPointMake(1501, 1416);
    station0145.platformIndex = 1;

    MWDrawFillCircle *fillCircle0176 = [[MWDrawFillCircle alloc] init];
    fillCircle0176.center = station0145.mapLocation;
    fillCircle0176.radius = 9.5;
    fillCircle0176.fillColor = [UIColor whiteColor];
    [station0145.drawPrimitives addObject:fillCircle0176];

    station0145.showNameOnMap = NO;
    [station0145.nameOriginalTextPrimitives addObject:drawTextLine0122];
    
    // Добавляем вершину
    edge0061.finishVertex = vertex0039;

    // Создаем участок линии Hynes Convention Ctr - Copley
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0062 = [[MWEdge alloc] init];
    edge0062.identifier = @"edge0062";
    edge0062.developmentName = @"Ребро: Hynes Convention Ctr - Copley";
    [self.edges addObject:edge0062];
    
    // Добавляем линию
    edge0062.line = line0010;
    
    // Добавляем вершину
    edge0062.startVertex = vertex0039;

    // Добавляем станцию Hynes Convention Ctr
    [edge0062.elements addObject:station0145];

    // Добавляем перегон
    MWHaul *haul0140 = [[MWHaul alloc] init];
    haul0140.identifier = @"haul0140";
    haul0140.length = 930;
    [edge0062.elements addObject:haul0140];
    
    haul0140.showOnMap = NO;
    [haul0140.drawPrimitives addObject:drawLine0168];
    
    // Добавляем станцию Copley
    MWStation *station0146 = [[MWStation alloc] init];
    station0146.identifier = @"station0146";
    [edge0062.elements addObject:station0146];
    
    station0146.nameOriginal = @"Copley";
    station0146.geoLocation = CGPointMake(42.350278, -71.0775);
    station0146.mapLocation = CGPointMake(1639, 1416);
    station0146.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0177 = [[MWDrawFillCircle alloc] init];
    fillCircle0177.center = station0146.mapLocation;
    fillCircle0177.radius = 9.5;
    fillCircle0177.fillColor = [UIColor whiteColor];
    [station0146.drawPrimitives addObject:fillCircle0177];

    station0146.showNameOnMap = NO;
    [station0146.nameOriginalTextPrimitives addObject:drawTextLine0123];
    
    // Добавляем вершину
    edge0062.finishVertex = vertex0037;

    // Создаем участок линии Copley - Arlington
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0063 = [[MWEdge alloc] init];
    edge0063.identifier = @"edge0063";
    edge0063.developmentName = @"Ребро: Copley - Arlington";
    [self.edges addObject:edge0063];
    
    // Добавляем линию
    edge0063.line = line0010;
    
    // Добавляем вершину
    edge0063.startVertex = vertex0037;

    // Добавляем станцию Copley
    [edge0063.elements addObject:station0146];

    // Добавляем перегон
    MWHaul *haul0141 = [[MWHaul alloc] init];
    haul0141.identifier = @"haul0141";
    haul0141.length = 590;
    [edge0063.elements addObject:haul0141];

    haul0141.showOnMap = NO;
    [haul0141.drawPrimitives addObject:drawLine0169];
    
    // Добавляем станцию Arlington
    MWStation *station0147 = [[MWStation alloc] init];
    station0147.identifier = @"station0147";
    [edge0063.elements addObject:station0147];
    
    station0147.nameOriginal = @"Arlington";
    station0147.geoLocation = CGPointMake(42.35186, -71.070728);
    station0147.mapLocation = CGPointMake(1777, 1416.5);
    station0147.platformIndex = 1;

    MWDrawFillCircle *fillCircle0178 = [[MWDrawFillCircle alloc] init];
    fillCircle0178.center = station0147.mapLocation;
    fillCircle0178.radius = 9.5;
    fillCircle0178.fillColor = [UIColor whiteColor];
    [station0147.drawPrimitives addObject:fillCircle0178];

    station0147.showNameOnMap = NO;
    [station0147.nameOriginalTextPrimitives addObject:drawTextLine0124];
    
    // Добавляем вершину
    edge0063.finishVertex = vertex0036;

    // Создаем участок линии Arlington - Boylston
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0064 = [[MWEdge alloc] init];
    edge0064.identifier = @"edge0064";
    edge0064.developmentName = @"Ребро: Arlington - Boylston";
    [self.edges addObject:edge0064];
    
    // Добавляем линию
    edge0064.line = line0010;
    
    // Добавляем вершину
    edge0064.startVertex = vertex0036;

    // Добавляем станцию Arlington
    [edge0064.elements addObject:station0147];

    // Добавляем перегон
    MWHaul *haul0142 = [[MWHaul alloc] init];
    haul0142.identifier = @"haul0142";
    haul0142.length = 502;
    [edge0064.elements addObject:haul0142];
    
    haul0142.showOnMap = NO;
    [haul0142.drawPrimitives addObject:drawLine0170];
    [haul0142.drawPrimitives addObject:drawArc0040];
    
    // Добавляем станцию Boylston
    MWStation *station0148 = [[MWStation alloc] init];
    station0148.identifier = @"station0148";
    [edge0064.elements addObject:station0148];
    
    station0148.nameOriginal = @"Boylston";
    station0148.geoLocation = CGPointMake(42.3525, -71.064722);
    station0148.mapLocation = CGPointMake(1915, 1411.5);
    station0148.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0179 = [[MWDrawFillCircle alloc] init];
    fillCircle0179.center = station0148.mapLocation;
    fillCircle0179.radius = 9.5;
    fillCircle0179.fillColor = [UIColor whiteColor];
    [station0148.drawPrimitives addObject:fillCircle0179];

    station0148.showNameOnMap = NO;
    [station0148.drawPrimitives addObject:fillCircle0158];
    
    // Добавляем вершину
    edge0064.finishVertex = vertex0025;

    // Создаем участок линии Boylston - Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0065 = [[MWEdge alloc] init];
    edge0065.identifier = @"edge0065";
    edge0065.developmentName = @"Ребро: Boylston - Park St";
    [self.edges addObject:edge0065];
    
    // Добавляем линию
    edge0065.line = line0010;
    
    // Добавляем вершину
    edge0065.startVertex = vertex0025;

    // Добавляем станцию Boylston
    [edge0065.elements addObject:station0148];

    // Добавляем перегон
    MWHaul *haul0143 = [[MWHaul alloc] init];
    haul0143.identifier = @"haul0143";
    haul0143.length = 487;
    [edge0065.elements addObject:haul0143];
    
    haul0143.showOnMap = NO;
    [haul0143.drawPrimitives addObject:drawArc0041];
    [haul0143.drawPrimitives addObject:drawLine0171];
    [haul0143.drawPrimitives addObject:drawTextLine0139];
    
    // Добавляем станцию Park St
    MWStation *station0149 = [[MWStation alloc] init];
    station0149.identifier = @"station0149";
    [edge0065.elements addObject:station0149];
    
    station0149.nameOriginal = @"Park Street";
    station0149.geoLocation = CGPointMake(42.356389, -71.0625);
    station0149.mapLocation = CGPointMake(2065.5, 1275.5);
    station0149.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0180 = [[MWDrawFillCircle alloc] init];
    fillCircle0180.center = station0149.mapLocation;
    fillCircle0180.radius = 9.5;
    fillCircle0180.fillColor = [UIColor whiteColor];
    [station0149.drawPrimitives addObject:fillCircle0180];

    station0149.showNameOnMap = NO;
    [station0149.nameOriginalTextPrimitives addObject:drawTextLine0009];
    
    // Добавляем вершину
    edge0065.finishVertex = vertex0002;

    // Создаем участок линии Park St - Government Center
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0066 = [[MWEdge alloc] init];
    edge0066.identifier = @"edge0066";
    edge0066.developmentName = @"Ребро: Park St - Government Center";
    [self.edges addObject:edge0066];
    
    // Добавляем линию
    edge0066.line = line0010;
    
    // Добавляем вершину
    edge0066.startVertex = vertex0002;

    // Добавляем станцию Park St
    [edge0066.elements addObject:station0149];

    // Добавляем перегон
    MWHaul *haul0144 = [[MWHaul alloc] init];
    haul0144.identifier = @"haul0144";
    haul0144.length = 432;
    [edge0066.elements addObject:haul0144];

    MWDrawLine *drawLine0187 = [[MWDrawLine alloc] init];
    drawLine0187.startPoint = CGPointMake(2065, 1276);
    drawLine0187.endPoint = CGPointMake(2167.5, 1172.5);
    drawLine0187.width = 32;
    drawLine0187.color = line0009.color;
    [haul0144.drawPrimitives addObject:drawLine0187];
    
    MWDrawTextLine *drawTextLine0140 = [[MWDrawTextLine alloc] init];
    drawTextLine0140.text = @"C, E";
    drawTextLine0140.fontName = @"Baskerville";
    drawTextLine0140.fontColor = [UIColor whiteColor];
    drawTextLine0140.fontSize = 20;
    drawTextLine0140.origin = CGPointMake(2093, 1230);
    drawTextLine0140.kernSpacing = - 0.4;
    drawTextLine0140.degrees = -45;
    [haul0144.drawPrimitives addObject:drawTextLine0140];

    // Добавляем станцию Gov’t. Ctr
    MWStation *station0150 = [[MWStation alloc] init];
    station0150.identifier = @"station0150";
    [edge0066.elements addObject:station0150];
    
    station0150.nameOriginal = @"Government Center";
    station0150.geoLocation = CGPointMake(42.359444, -71.059444);
    station0150.mapLocation = CGPointMake(2167.5, 1172.5);
    station0150.platformIndex = 1;
    
    station0150.showNameOnMap = NO;
    [station0150.nameOriginalTextPrimitives addObject:drawTextLine0057];
    [station0150.nameOriginalTextPrimitives addObject:drawTextLine0058];
    [station0150.nameOriginalTextPrimitives addObject:drawTextLine0059];

    // Добавляем вершину
    edge0066.finishVertex = vertex0017;

    // Создаем участок линии Government Center - Haymarket
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0067 = [[MWEdge alloc] init];
    edge0067.identifier = @"edge0067";
    edge0067.developmentName = @"Ребро: Government Center - Haymarket";
    [self.edges addObject:edge0067];
    
    // Добавляем линию
    edge0067.line = line0010;
    
    // Добавляем вершину
    edge0067.startVertex = vertex0017;

    // Добавляем станцию Gov’t. Ctr
    [edge0067.elements addObject:station0150];
    
    // Добавляем перегон
    MWHaul *haul0145 = [[MWHaul alloc] init];
    haul0145.identifier = @"haul0145";
    haul0145.length = 450;
    [edge0067.elements addObject:haul0145];

    MWDrawLine *drawLine0188 = [[MWDrawLine alloc] init];
    drawLine0188.startPoint = CGPointMake(2167, 1173);
    drawLine0188.endPoint = CGPointMake(2270, 1071);
    drawLine0188.width = 32;
    drawLine0188.color = line0009.color;
     [haul0145.drawPrimitives addObject:drawLine0188];

    MWDrawTextLine *drawTextLine0141 = [[MWDrawTextLine alloc] init];
    drawTextLine0141.text = @"C, E";
    drawTextLine0141.fontName = @"Baskerville";
    drawTextLine0141.fontColor = [UIColor whiteColor];
    drawTextLine0141.fontSize = 20;
    drawTextLine0141.origin = CGPointMake(2199, 1124);
    drawTextLine0141.kernSpacing = - 0.4;
    drawTextLine0141.degrees = -45;
    [haul0145.drawPrimitives addObject:drawTextLine0141];

    // Добавляем станцию Haymarket
    MWStation *station0151 = [[MWStation alloc] init];
    station0151.identifier = @"station0151";
    [edge0067.elements addObject:station0151];
    
    station0151.nameOriginal = @"Haymarket";
    station0151.geoLocation = CGPointMake(42.3633, -71.0582);
    station0151.mapLocation = CGPointMake(2270, 1071);
    station0151.platformIndex = 1;

    MWDrawFillCircle *fillCircle0181 = [[MWDrawFillCircle alloc] init];
    fillCircle0181.center = station0151.mapLocation;
    fillCircle0181.radius = 9.5;
    fillCircle0181.fillColor = [UIColor whiteColor];
    [station0151.drawPrimitives addObject:fillCircle0181];

    station0151.showNameOnMap = NO;
    [station0151.drawPrimitives addObject:drawLine0056];
    [station0151.nameOriginalTextPrimitives addObject:drawTextLine0047];
    
    // Добавляем вершину
    edge0067.finishVertex = vertex0013;

    // Создаем участок линии Haymarket - North Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0068 = [[MWEdge alloc] init];
    edge0068.identifier = @"edge0068";
    edge0068.developmentName = @"Ребро: Haymarket - North Station";
    [self.edges addObject:edge0068];
    
    // Добавляем линию
    edge0068.line = line0010;
    
    // Добавляем вершину
    edge0068.startVertex = vertex0013;

    // Добавляем станцию Haymarket
    [edge0068.elements addObject:station0151];
    
    // Добавляем перегон
    MWHaul *haul0146 = [[MWHaul alloc] init];
    haul0146.identifier = @"haul0146";
    haul0146.length = 370;
    [edge0068.elements addObject:haul0146];

    MWDrawLine *drawLine0189 = [[MWDrawLine alloc] init];
    drawLine0189.startPoint = CGPointMake(2269.5, 1071.5);
    drawLine0189.endPoint = CGPointMake(2299, 1042);
    drawLine0189.width = 32;
    drawLine0189.color = line0009.color;
    [haul0146.drawPrimitives addObject:drawLine0189];

    MWDrawArc *drawArc0045 = [[MWDrawArc alloc] init];
    drawArc0045.center = CGPointMake(2244, 989);
    drawArc0045.startRadians = 315 * M_PI / 180;
    drawArc0045.endRadians = 45 * M_PI / 180;
    drawArc0045.radius = 76;
    drawArc0045.width = 32;
    drawArc0045.color = line0009.color;
    [haul0146.drawPrimitives addObject:drawArc0045];

    MWDrawLine *drawLine0190 = [[MWDrawLine alloc] init];
    drawLine0190.startPoint = CGPointMake(2299, 936.5);
    drawLine0190.endPoint = CGPointMake(2269.5, 906.5);
    drawLine0190.width = 32;
    drawLine0190.color = line0010.color;
    [haul0146.drawPrimitives addObject:drawLine0190];

    MWDrawTextLine *drawTextLine0142 = [[MWDrawTextLine alloc] init];
    drawTextLine0142.text = @"C,  E";
    drawTextLine0142.fontName = @"Baskerville";
    drawTextLine0142.fontColor = [UIColor whiteColor];
    drawTextLine0142.fontSize = 20;
    drawTextLine0142.origin = CGPointMake(2309, 1012);
    drawTextLine0142.kernSpacing = 0.5;
    drawTextLine0142.degrees = -90;
    [haul0146.drawPrimitives addObject:drawTextLine0142];

    // Добавляем станцию North Station
    MWStation *station0152 = [[MWStation alloc] init];
    station0152.identifier = @"station0152";
    [edge0068.elements addObject:station0152];
    
    station0152.nameOriginal = @"North Station";
    station0152.geoLocation = CGPointMake(42.3657, -71.061);
    station0152.mapLocation = CGPointMake(2269.5, 906.5);
    station0152.platformIndex = 1;

    MWDrawFillCircle *fillCircle0182 = [[MWDrawFillCircle alloc] init];
    fillCircle0182.center = station0152.mapLocation;
    fillCircle0182.radius = 16;
    fillCircle0182.fillColor = line0010.color;
    [station0152.drawPrimitives addObject:fillCircle0182];

    MWDrawFillCircle *fillCircle0183 = [[MWDrawFillCircle alloc] init];
    fillCircle0183.center = station0152.mapLocation;
    fillCircle0183.radius = 9.5;
    fillCircle0183.fillColor = [UIColor whiteColor];
    [station0152.drawPrimitives addObject:fillCircle0183];

    station0152.showNameOnMap = NO;
    [station0152.nameOriginalTextPrimitives addObject:drawTextLine0048];
    
    // Добавляем вершину
    edge0068.finishVertex = vertex0014;

    ////////////////////////////////////////////////////////////////
    // 11. Green Line D
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Riverside - Kenmore
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0069 = [[MWEdge alloc] init];
    edge0069.identifier = @"edge0069";
    edge0069.developmentName = @"Ребро: Riverside - Kenmore";
    [self.edges addObject:edge0069];
    
    // Добавляем линию
    edge0069.line = line0011;
    
    // Добавляем вершину
    edge0069.startVertex = vertex0043;
    
    // Добавляем станцию Riverside
    MWStation *station0153 = [[MWStation alloc] init];
    station0153.identifier = @"station0153";
    [edge0069.elements addObject:station0153];
    
    station0153.nameOriginal = @"Riverside";
    station0153.geoLocation = CGPointMake(42.3372, -71.2521);
    station0153.mapLocation = CGPointMake(602.5, 2076);

    MWDrawFillCircle *fillCircle0184 = [[MWDrawFillCircle alloc] init];
    fillCircle0184.center = station0153.mapLocation;
    fillCircle0184.radius = 16;
    fillCircle0184.fillColor = line0011.color;
    [station0153.drawPrimitives addObject:fillCircle0184];
    
    MWDrawFillCircle *fillCircle0185 = [[MWDrawFillCircle alloc] init];
    fillCircle0185.center = station0153.mapLocation;
    fillCircle0185.radius = 9.5;
    fillCircle0185.fillColor = [UIColor whiteColor];
    [station0153.drawPrimitives addObject:fillCircle0185];

    MWDrawTextLine *drawTextLine0143 = [[MWDrawTextLine alloc] init];
    drawTextLine0143.text = @"RIVERSIDE";
    drawTextLine0143.fontName = @"Baskerville";
    drawTextLine0143.fontColor = [UIColor blackColor];
    drawTextLine0143.fontSize = 36;
    drawTextLine0143.origin = CGPointMake(357, 2055);
    drawTextLine0143.kernSpacing = -0.8;
    [station0153.nameOriginalTextPrimitives addObject:drawTextLine0143];
    
    // Добавляем перегон
    MWHaul *haul0147 = [[MWHaul alloc] init];
    haul0147.identifier = @"haul0147";
    haul0147.length = 838;
    [edge0069.elements addObject:haul0147];

    MWDrawArc *drawArc0046 = [[MWDrawArc alloc] init];
    drawArc0046.center = CGPointMake(602, 1996);
    drawArc0046.startRadians = 45 * M_PI / 180;
    drawArc0046.endRadians = 90 * M_PI / 180;
    drawArc0046.radius = 80;
    drawArc0046.width = 32;
    drawArc0046.color = line0011.color;
    [haul0147.drawPrimitives addObject:drawArc0046];

    MWDrawLine *drawLine0191 = [[MWDrawLine alloc] init];
    drawLine0191.startPoint = CGPointMake(657, 2054.2);
    drawLine0191.endPoint = CGPointMake(682, 2033.5);
    drawLine0191.width = 32;
    drawLine0191.color = line0009.color;
    [haul0147.drawPrimitives addObject:drawLine0191];

    // Добавляем станцию Woodland
    MWStation *station0154 = [[MWStation alloc] init];
    station0154.identifier = @"station0154";
    [edge0069.elements addObject:station0154];
    
    station0154.nameOriginal = @"Woodland";
    station0154.geoLocation = CGPointMake(42.333056, -71.243611);
    station0154.mapLocation = CGPointMake(682, 2033.5);

    MWDrawFillCircle *fillCircle0186 = [[MWDrawFillCircle alloc] init];
    fillCircle0186.center = station0154.mapLocation;
    fillCircle0186.radius = 9.5;
    fillCircle0186.fillColor = [UIColor whiteColor];
    [station0154.drawPrimitives addObject:fillCircle0186];

    MWDrawTextLine *drawTextLine0144 = [[MWDrawTextLine alloc] init];
    drawTextLine0144.text = station0154.nameOriginal;
    drawTextLine0144.fontName = @"Baskerville";
    drawTextLine0144.fontColor = [UIColor blackColor];
    drawTextLine0144.fontSize = 34;
    drawTextLine0144.origin = CGPointMake(490, 1999);
    drawTextLine0144.kernSpacing = - 2.2;
    [station0154.nameOriginalTextPrimitives addObject:drawTextLine0144];

    // Добавляем перегон
    MWHaul *haul0148 = [[MWHaul alloc] init];
    haul0148.identifier = @"haul0148";
    haul0148.length = 1344;
    [edge0069.elements addObject:haul0148];

    MWDrawLine *drawLine0192 = [[MWDrawLine alloc] init];
    drawLine0192.startPoint = CGPointMake(680.5, 2035);
    drawLine0192.endPoint = CGPointMake(732, 1983.5);
    drawLine0192.width = 32;
    drawLine0192.color = line0009.color;
    [haul0148.drawPrimitives addObject:drawLine0192];

    // Добавляем станцию Waban
    MWStation *station0155 = [[MWStation alloc] init];
    station0155.identifier = @"station0155";
    [edge0069.elements addObject:station0155];
    
    station0155.nameOriginal = @"Waban";
    station0155.geoLocation = CGPointMake(42.325833, -71.230556);
    station0155.mapLocation = CGPointMake(732, 1983.5);

    MWDrawFillCircle *fillCircle0187 = [[MWDrawFillCircle alloc] init];
    fillCircle0187.center = station0155.mapLocation;
    fillCircle0187.radius = 9.5;
    fillCircle0187.fillColor = [UIColor whiteColor];
    [station0155.drawPrimitives addObject:fillCircle0187];

    MWDrawTextLine *drawTextLine0145 = [[MWDrawTextLine alloc] init];
    drawTextLine0145.text = station0155.nameOriginal;
    drawTextLine0145.fontName = @"Baskerville";
    drawTextLine0145.fontColor = [UIColor blackColor];
    drawTextLine0145.fontSize = 34;
    drawTextLine0145.origin = CGPointMake(604, 1950);
    drawTextLine0145.kernSpacing = - 2.4;
    [station0155.nameOriginalTextPrimitives addObject:drawTextLine0145];

    // Добавляем перегон
    MWHaul *haul0149 = [[MWHaul alloc] init];
    haul0149.identifier = @"haul0149";
    haul0149.length = 1402;
    [edge0069.elements addObject:haul0149];

    MWDrawLine *drawLine0193 = [[MWDrawLine alloc] init];
    drawLine0193.startPoint = CGPointMake(731.5, 1984);
    drawLine0193.endPoint = CGPointMake(782, 1934);
    drawLine0193.width = 32;
    drawLine0193.color = line0009.color;
    [haul0149.drawPrimitives addObject:drawLine0193];

    // Добавляем станцию Eliot
    MWStation *station0156 = [[MWStation alloc] init];
    station0156.identifier = @"station0156";
    [edge0069.elements addObject:station0156];
    
    station0156.nameOriginal = @"Eliot";
    station0156.geoLocation = CGPointMake(42.318889, -71.216389);
    station0156.mapLocation = CGPointMake(782, 1934);
    
    MWDrawFillCircle *fillCircle0188 = [[MWDrawFillCircle alloc] init];
    fillCircle0188.center = station0156.mapLocation;
    fillCircle0188.radius = 9.5;
    fillCircle0188.fillColor = [UIColor whiteColor];
    [station0156.drawPrimitives addObject:fillCircle0188];

    MWDrawTextLine *drawTextLine0146 = [[MWDrawTextLine alloc] init];
    drawTextLine0146.text = station0156.nameOriginal;
    drawTextLine0146.fontName = @"Baskerville";
    drawTextLine0146.fontColor = [UIColor blackColor];
    drawTextLine0146.fontSize = 34;
    drawTextLine0146.origin = CGPointMake(684, 1900.5);
    drawTextLine0146.kernSpacing = - 0.6;
    [station0156.nameOriginalTextPrimitives addObject:drawTextLine0146];

    // Добавляем перегон
    MWHaul *haul0150 = [[MWHaul alloc] init];
    haul0150.identifier = @"haul0150";
    haul0150.length = 1171;
    [edge0069.elements addObject:haul0150];

    MWDrawLine *drawLine0194 = [[MWDrawLine alloc] init];
    drawLine0194.startPoint = CGPointMake(781.5, 1934.5);
    drawLine0194.endPoint = CGPointMake(831.5, 1884);
    drawLine0194.width = 32;
    drawLine0194.color = line0009.color;
    [haul0150.drawPrimitives addObject:drawLine0194];

    // Добавляем станцию Newton Highlands
    MWStation *station0157 = [[MWStation alloc] init];
    station0157.identifier = @"station0157";
    [edge0069.elements addObject:station0157];
    
    station0157.nameOriginal = @"Newton Highlands";
    station0157.geoLocation = CGPointMake(42.3225, -71.205556);
    station0157.mapLocation = CGPointMake(831.5, 1884);

    MWDrawFillCircle *fillCircle0189 = [[MWDrawFillCircle alloc] init];
    fillCircle0189.center = station0157.mapLocation;
    fillCircle0189.radius = 9.5;
    fillCircle0189.fillColor = [UIColor whiteColor];
    [station0157.drawPrimitives addObject:fillCircle0189];

    MWDrawTextLine *drawTextLine0147 = [[MWDrawTextLine alloc] init];
    drawTextLine0147.text = station0157.nameOriginal;
    drawTextLine0147.fontName = @"Baskerville";
    drawTextLine0147.fontColor = [UIColor blackColor];
    drawTextLine0147.fontSize = 34;
    drawTextLine0147.origin = CGPointMake(556, 1854);
    drawTextLine0147.kernSpacing = - 2.0;
    [station0157.nameOriginalTextPrimitives addObject:drawTextLine0147];

    // Добавляем перегон
    MWHaul *haul0151 = [[MWHaul alloc] init];
    haul0151.identifier = @"haul0151";
    haul0151.length = 1328;
    [edge0069.elements addObject:haul0151];

    MWDrawLine *drawLine0195 = [[MWDrawLine alloc] init];
    drawLine0195.startPoint = CGPointMake(831, 1884.5);
    drawLine0195.endPoint = CGPointMake(883, 1833);
    drawLine0195.width = 32;
    drawLine0195.color = line0009.color;
    [haul0151.drawPrimitives addObject:drawLine0195];

    // Добавляем станцию Newton Centre
    MWStation *station0158 = [[MWStation alloc] init];
    station0158.identifier = @"station0158";
    [edge0069.elements addObject:station0158];
    
    station0158.nameOriginal = @"Newton Centre";
    station0158.geoLocation = CGPointMake(42.329444, -71.1925);
    station0158.mapLocation = CGPointMake(883, 1833);

    MWDrawFillCircle *fillCircle0190 = [[MWDrawFillCircle alloc] init];
    fillCircle0190.center = station0158.mapLocation;
    fillCircle0190.radius = 9.5;
    fillCircle0190.fillColor = [UIColor whiteColor];
    [station0158.drawPrimitives addObject:fillCircle0190];

    MWDrawTextLine *drawTextLine0148 = [[MWDrawTextLine alloc] init];
    drawTextLine0148.text = station0158.nameOriginal;
    drawTextLine0148.fontName = @"Baskerville";
    drawTextLine0148.fontColor = [UIColor blackColor];
    drawTextLine0148.fontSize = 34;
    drawTextLine0148.origin = CGPointMake(624 , 1802);
    drawTextLine0148.kernSpacing = - 2.2;
    [station0158.nameOriginalTextPrimitives addObject:drawTextLine0148];

    // Добавляем перегон
    MWHaul *haul0152 = [[MWHaul alloc] init];
    haul0152.identifier = @"haul0152";
    haul0152.length = 2381;
    [edge0069.elements addObject:haul0152];

    MWDrawLine *drawLine0196 = [[MWDrawLine alloc] init];
    drawLine0196.startPoint = CGPointMake(882.5, 1833.5);
    drawLine0196.endPoint = CGPointMake(933, 1783.5);
    drawLine0196.width = 32;
    drawLine0196.color = line0009.color;
    [haul0152.drawPrimitives addObject:drawLine0196];

    // Добавляем станцию Chestnut Hill
    MWStation *station0159 = [[MWStation alloc] init];
    station0159.identifier = @"station0159";
    [edge0069.elements addObject:station0159];
    
    station0159.nameOriginal = @"Chestnut Hill";
    station0159.geoLocation = CGPointMake(42.326944, -71.164722);
    station0159.mapLocation = CGPointMake(933, 1783.5);

    MWDrawFillCircle *fillCircle0191 = [[MWDrawFillCircle alloc] init];
    fillCircle0191.center = station0159.mapLocation;
    fillCircle0191.radius = 9.5;
    fillCircle0191.fillColor = [UIColor whiteColor];
    [station0159.drawPrimitives addObject:fillCircle0191];

    MWDrawTextLine *drawTextLine0149 = [[MWDrawTextLine alloc] init];
    drawTextLine0149.text = station0159.nameOriginal;
    drawTextLine0149.fontName = @"Baskerville";
    drawTextLine0149.fontColor = [UIColor blackColor];
    drawTextLine0149.fontSize = 34;
    drawTextLine0149.origin = CGPointMake(732, 1751);
    drawTextLine0149.kernSpacing = - 1.8;
    [station0159.nameOriginalTextPrimitives addObject:drawTextLine0149];

    // Добавляем перегон
    MWHaul *haul0153 = [[MWHaul alloc] init];
    haul0153.identifier = @"haul0153";
    haul0153.length = 1668;
    [edge0069.elements addObject:haul0153];

    MWDrawLine *drawLine0197 = [[MWDrawLine alloc] init];
    drawLine0197.startPoint = CGPointMake(932.5, 1784);
    drawLine0197.endPoint = CGPointMake(982.5, 1734);
    drawLine0197.width = 32;
    drawLine0197.color = line0009.color;
    [haul0153.drawPrimitives addObject:drawLine0197];

    // Добавляем станцию Reservoir
    MWStation *station0160 = [[MWStation alloc] init];
    station0160.identifier = @"station0160";
    [edge0069.elements addObject:station0160];
    
    station0160.nameOriginal = @"Reservoir";
    station0160.geoLocation = CGPointMake(42.335278, -71.148056);
    station0160.mapLocation = CGPointMake(982.5, 1734);

    MWDrawFillCircle *fillCircle0192 = [[MWDrawFillCircle alloc] init];
    fillCircle0192.center = station0160.mapLocation;
    fillCircle0192.radius = 9.5;
    fillCircle0192.fillColor = [UIColor whiteColor];
    [station0160.drawPrimitives addObject:fillCircle0192];

    MWDrawTextLine *drawTextLine0150 = [[MWDrawTextLine alloc] init];
    drawTextLine0150.text = station0160.nameOriginal;
    drawTextLine0150.fontName = @"Baskerville";
    drawTextLine0150.fontColor = [UIColor blackColor];
    drawTextLine0150.fontSize = 34;
    drawTextLine0150.origin = CGPointMake(790, 1702.5);
    drawTextLine0150.kernSpacing = - 1.3;
    [station0160.nameOriginalTextPrimitives addObject:drawTextLine0150];

    // Добавляем перегон
    MWHaul *haul0154 = [[MWHaul alloc] init];
    haul0154.identifier = @"haul0154";
    haul0154.length = 624;
    [edge0069.elements addObject:haul0154];

    MWDrawLine *drawLine0198 = [[MWDrawLine alloc] init];
    drawLine0198.startPoint = CGPointMake(982, 1734.5);
    drawLine0198.endPoint = CGPointMake(1032, 1684.5);
    drawLine0198.width = 32;
    drawLine0198.color = line0009.color;
    [haul0154.drawPrimitives addObject:drawLine0198];

    // Добавляем станцию Beaconsfield
    MWStation *station0161 = [[MWStation alloc] init];
    station0161.identifier = @"station0161";
    [edge0069.elements addObject:station0161];
    
    station0161.nameOriginal = @"Beaconsfield";
    station0161.geoLocation = CGPointMake(42.335833, -71.140556);
    station0161.mapLocation = CGPointMake(1032, 1684.5);

    MWDrawFillCircle *fillCircle0193 = [[MWDrawFillCircle alloc] init];
    fillCircle0193.center = station0161.mapLocation;
    fillCircle0193.radius = 9.5;
    fillCircle0193.fillColor = [UIColor whiteColor];
    [station0161.drawPrimitives addObject:fillCircle0193];

    MWDrawTextLine *drawTextLine0151 = [[MWDrawTextLine alloc] init];
    drawTextLine0151.text = station0161.nameOriginal;
    drawTextLine0151.fontName = @"Baskerville";
    drawTextLine0151.fontColor = [UIColor blackColor];
    drawTextLine0151.fontSize = 34;
    drawTextLine0151.origin = CGPointMake(828, 1652.5);
    drawTextLine0151.kernSpacing = - 1.2;
    [station0161.nameOriginalTextPrimitives addObject:drawTextLine0151];

    // Добавляем перегон
    MWHaul *haul0155 = [[MWHaul alloc] init];
    haul0155.identifier = @"haul0155";
    haul0155.length = 1282;
    [edge0069.elements addObject:haul0155];

    MWDrawLine *drawLine0199 = [[MWDrawLine alloc] init];
    drawLine0199.startPoint = CGPointMake(1031.5, 1685);
    drawLine0199.endPoint = CGPointMake(1082, 1635);
    drawLine0199.width = 32;
    drawLine0199.color = line0009.color;
    [haul0155.drawPrimitives addObject:drawLine0199];

    // Добавляем станцию Brookline Hills
    MWStation *station0162 = [[MWStation alloc] init];
    station0162.identifier = @"station0162";
    [edge0069.elements addObject:station0162];
    
    station0162.nameOriginal = @"Brookline Hills";
    station0162.geoLocation = CGPointMake(42.331389, -71.126667);
    station0162.mapLocation = CGPointMake(1082, 1635);

    MWDrawFillCircle *fillCircle0194 = [[MWDrawFillCircle alloc] init];
    fillCircle0194.center = station0162.mapLocation;
    fillCircle0194.radius = 9.5;
    fillCircle0194.fillColor = [UIColor whiteColor];
    [station0162.drawPrimitives addObject:fillCircle0194];

    MWDrawTextLine *drawTextLine0152 = [[MWDrawTextLine alloc] init];
    drawTextLine0152.text = station0162.nameOriginal;
    drawTextLine0152.fontName = @"Baskerville";
    drawTextLine0152.fontColor = [UIColor blackColor];
    drawTextLine0152.fontSize = 34;
    drawTextLine0152.origin = CGPointMake(831, 1604);
    drawTextLine0152.kernSpacing = - 1.2;
    [station0162.nameOriginalTextPrimitives addObject:drawTextLine0152];

    // Добавляем перегон
    MWHaul *haul0156 = [[MWHaul alloc] init];
    haul0156.identifier = @"haul0156";
    haul0156.length = 830;
    [edge0069.elements addObject:haul0156];

    MWDrawLine *drawLine0200 = [[MWDrawLine alloc] init];
    drawLine0200.startPoint = CGPointMake(1081.5, 1635.5);
    drawLine0200.endPoint = CGPointMake(1132.5, 1584.5);
    drawLine0200.width = 32;
    drawLine0200.color = line0009.color;
    [haul0156.drawPrimitives addObject:drawLine0200];

    // Добавляем станцию Brookline Village
    MWStation *station0163 = [[MWStation alloc] init];
    station0163.identifier = @"station0163";
    [edge0069.elements addObject:station0163];
    
    station0163.nameOriginal = @"Brookline Village";
    station0163.geoLocation = CGPointMake(42.3325, -71.116944);
    station0163.mapLocation = CGPointMake(1132.5, 1584.5);

    MWDrawFillCircle *fillCircle0195 = [[MWDrawFillCircle alloc] init];
    fillCircle0195.center = station0163.mapLocation;
    fillCircle0195.radius = 9.5;
    fillCircle0195.fillColor = [UIColor whiteColor];
    [station0163.drawPrimitives addObject:fillCircle0195];

    MWDrawTextLine *drawTextLine0153 = [[MWDrawTextLine alloc] init];
    drawTextLine0153.text = station0163.nameOriginal;
    drawTextLine0153.fontName = @"Baskerville";
    drawTextLine0153.fontColor = [UIColor blackColor];
    drawTextLine0153.fontSize = 34;
    drawTextLine0153.origin = CGPointMake(847, 1553.5);
    drawTextLine0153.kernSpacing = - 1.0;
    [station0163.nameOriginalTextPrimitives addObject:drawTextLine0153];

    // Добавляем перегон
    MWHaul *haul0157 = [[MWHaul alloc] init];
    haul0157.identifier = @"haul0157";
    haul0157.length = 1200;
    [edge0069.elements addObject:haul0157];

    MWDrawLine *drawLine0201 = [[MWDrawLine alloc] init];
    drawLine0201.startPoint = CGPointMake(1132, 1585);
    drawLine0201.endPoint = CGPointMake(1182.5, 1534.5);
    drawLine0201.width = 32;
    drawLine0201.color = line0009.color;
    [haul0157.drawPrimitives addObject:drawLine0201];

    // Добавляем станцию Longwood
    MWStation *station0164 = [[MWStation alloc] init];
    station0164.identifier = @"station0164";
    [edge0069.elements addObject:station0164];
    
    station0164.nameOriginal = @"Longwood";
    station0164.geoLocation = CGPointMake(42.341667, -71.11);
    station0164.mapLocation = CGPointMake(1182.5, 1534.5);

    MWDrawFillCircle *fillCircle0196 = [[MWDrawFillCircle alloc] init];
    fillCircle0196.center = station0164.mapLocation;
    fillCircle0196.radius = 9.5;
    fillCircle0196.fillColor = [UIColor whiteColor];
    [station0164.drawPrimitives addObject:fillCircle0196];

    MWDrawTextLine *drawTextLine0154 = [[MWDrawTextLine alloc] init];
    drawTextLine0154.text = station0164.nameOriginal;
    drawTextLine0154.fontName = @"Baskerville";
    drawTextLine0154.fontColor = [UIColor blackColor];
    drawTextLine0154.fontSize = 34;
    drawTextLine0154.origin = CGPointMake(980, 1502);
    drawTextLine0154.kernSpacing = - 1.8;
    [station0164.nameOriginalTextPrimitives addObject:drawTextLine0154];

    // Добавляем перегон
    MWHaul *haul0158 = [[MWHaul alloc] init];
    haul0158.identifier = @"haul0158";
    haul0158.length = 572;
    [edge0069.elements addObject:haul0158];

    MWDrawLine *drawLine0202 = [[MWDrawLine alloc] init];
    drawLine0202.startPoint = CGPointMake(1182, 1535);
    drawLine0202.endPoint = CGPointMake(1233, 1484.5);
    drawLine0202.width = 32;
    drawLine0202.color = line0009.color;
    [haul0158.drawPrimitives addObject:drawLine0202];

    // Добавляем станцию Fenway
    MWStation *station0165 = [[MWStation alloc] init];
    station0165.identifier = @"station0165";
    [edge0069.elements addObject:station0165];
    
    station0165.nameOriginal = @"Fenway";
    station0165.geoLocation = CGPointMake(42.345042, -71.104825);
    station0165.mapLocation = CGPointMake(1233, 1484.5);

    MWDrawFillCircle *fillCircle0197 = [[MWDrawFillCircle alloc] init];
    fillCircle0197.center = station0165.mapLocation;
    fillCircle0197.radius = 9.5;
    fillCircle0197.fillColor = [UIColor whiteColor];
    [station0165.drawPrimitives addObject:fillCircle0197];

    MWDrawTextLine *drawTextLine0155 = [[MWDrawTextLine alloc] init];
    drawTextLine0155.text = station0165.nameOriginal;
    drawTextLine0155.fontName = @"Baskerville";
    drawTextLine0155.fontColor = [UIColor blackColor];
    drawTextLine0155.fontSize = 34;
    drawTextLine0155.origin = CGPointMake(1066, 1452);
    drawTextLine0155.kernSpacing = - 1.4;
    [station0165.nameOriginalTextPrimitives addObject:drawTextLine0155];

    // Добавляем перегон
    MWHaul *haul0159 = [[MWHaul alloc] init];
    haul0159.identifier = @"haul0159";
    haul0159.length = 879;
    [edge0069.elements addObject:haul0159];

    MWDrawLine *drawLine0203 = [[MWDrawLine alloc] init];
    drawLine0203.startPoint = CGPointMake(1232.5, 1485);
    drawLine0203.endPoint = CGPointMake(1272.5, 1445);
    drawLine0203.width = 32;
    drawLine0203.color = line0011.color;
    [haul0159.drawPrimitives addObject:drawLine0203];

    MWDrawArc *drawArc0047 = [[MWDrawArc alloc] init];
    drawArc0047.center = CGPointMake(1342.5, 1516.5);
    drawArc0047.startRadians = 225 * M_PI / 180;
    drawArc0047.endRadians = 270 * M_PI / 180;
    drawArc0047.radius = 100;
    drawArc0047.width = 32;
    drawArc0047.color = line0011.color;
    [haul0159.drawPrimitives addObject:drawArc0047];

    MWDrawLine *drawLine0204 = [[MWDrawLine alloc] init];
    drawLine0204.startPoint = CGPointMake(1342, 1416.5);
    drawLine0204.endPoint = CGPointMake(1362, 1416.5);
    drawLine0204.width = 32;
    drawLine0204.color = line0011.color;
    [haul0159.drawPrimitives addObject:drawLine0204];

    // Добавляем станцию Kenmore
    MWStation *station0166 = [[MWStation alloc] init];
    station0166.identifier = @"station0166";
    [edge0069.elements addObject:station0166];
    
    station0166.nameOriginal = @"Kenmore";
    station0166.geoLocation = CGPointMake(42.348925, -71.095608);
    station0166.mapLocation = CGPointMake(1362, 1416.5);
    station0166.platformIndex = 1;

    MWDrawFillCircle *fillCircle0198 = [[MWDrawFillCircle alloc] init];
    fillCircle0198.center = station0166.mapLocation;
    fillCircle0198.radius = 9.5;
    fillCircle0198.fillColor = [UIColor whiteColor];
    [station0166.drawPrimitives addObject:fillCircle0198];

    station0166.showNameOnMap = NO;
    [station0166.nameOriginalTextPrimitives addObject:drawTextLine0121];

    // Добавляем вершину
    edge0069.finishVertex = vertex0040;

    // Создаем участок линии Kenmore - Hynes Convention Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0070 = [[MWEdge alloc] init];
    edge0070.identifier = @"edge0070";
    edge0070.developmentName = @"Ребро: Kenmore - Hynes Convention Ctr";
    [self.edges addObject:edge0070];
    
    // Добавляем линию
    edge0070.line = line0011;
    
    // Добавляем вершину
    edge0070.startVertex = vertex0040;

    // Добавляем станцию Kenmore
    [edge0070.elements addObject:station0166];
    
    // Добавляем перегон
    MWHaul *haul0160 = [[MWHaul alloc] init];
    haul0160.identifier = @"haul0160";
    haul0160.length = 709;
    [edge0070.elements addObject:haul0160];

    haul0160.showOnMap = NO;
    [haul0160.drawPrimitives addObject:drawLine0167];

    // Добавляем станцию Hynes Convention Ctr
    MWStation *station0167 = [[MWStation alloc] init];
    station0167.identifier = @"station0167";
    [edge0070.elements addObject:station0167];
    
    station0167.nameOriginal = @"Hynes Convention Center";
    station0167.geoLocation = CGPointMake(42.347806, -71.087828);
    station0167.mapLocation = CGPointMake(1501, 1416);
    station0167.platformIndex = 1;

    MWDrawFillCircle *fillCircle0199 = [[MWDrawFillCircle alloc] init];
    fillCircle0199.center = station0167.mapLocation;
    fillCircle0199.radius = 9.5;
    fillCircle0199.fillColor = [UIColor whiteColor];
    [station0167.drawPrimitives addObject:fillCircle0199];

    station0167.showNameOnMap = NO;
    [station0167.nameOriginalTextPrimitives addObject:drawTextLine0122];

    // Добавляем вершину
    edge0070.finishVertex = vertex0039;

    // Создаем участок линии Hynes Convention Ctr - Copley
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0071 = [[MWEdge alloc] init];
    edge0071.identifier = @"edge0071";
    edge0071.developmentName = @"Ребро: Hynes Convention Ctr - Copley";
    [self.edges addObject:edge0071];
    
    // Добавляем линию
    edge0071.line = line0011;
    
    // Добавляем вершину
    edge0071.startVertex = vertex0039;

    // Добавляем станцию Hynes Convention Ctr
    [edge0071.elements addObject:station0167];

    // Добавляем перегон
    MWHaul *haul0161 = [[MWHaul alloc] init];
    haul0161.identifier = @"haul0161";
    haul0161.length = 930;
    [edge0071.elements addObject:haul0161];

    haul0161.showOnMap = NO;
    [haul0161.drawPrimitives addObject:drawLine0168];

    // Добавляем станцию Copley
    MWStation *station0168 = [[MWStation alloc] init];
    station0168.identifier = @"station0168";
    [edge0071.elements addObject:station0168];
    
    station0168.nameOriginal = @"Copley";
    station0168.geoLocation = CGPointMake(42.350278, -71.0775);
    station0168.mapLocation = CGPointMake(1639, 1416);
    station0168.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0200 = [[MWDrawFillCircle alloc] init];
    fillCircle0200.center = station0168.mapLocation;
    fillCircle0200.radius = 9.5;
    fillCircle0200.fillColor = [UIColor whiteColor];
    [station0168.drawPrimitives addObject:fillCircle0200];

    station0168.showNameOnMap = NO;
    [station0168.nameOriginalTextPrimitives addObject:drawTextLine0123];

    // Добавляем вершину
    edge0071.finishVertex = vertex0037;

    // Создаем участок линии Copley - Arlington
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0072 = [[MWEdge alloc] init];
    edge0072.identifier = @"edge0072";
    edge0072.developmentName = @"Ребро: Copley - Arlington";
    [self.edges addObject:edge0072];
    
    // Добавляем линию
    edge0072.line = line0011;
    
    // Добавляем вершину
    edge0072.startVertex = vertex0037;

    // Добавляем станцию Copley
    [edge0072.elements addObject:station0168];
    
    // Добавляем перегон
    MWHaul *haul0162 = [[MWHaul alloc] init];
    haul0162.identifier = @"haul0162";
    haul0162.length = 590;
    [edge0072.elements addObject:haul0162];

    haul0162.showOnMap = NO;
    [haul0162.drawPrimitives addObject:drawLine0169];

    // Добавляем станцию Arlington
    MWStation *station0169 = [[MWStation alloc] init];
    station0169.identifier = @"station0169";
    [edge0072.elements addObject:station0169];
    
    station0169.nameOriginal = @"Arlington";
    station0169.geoLocation = CGPointMake(42.35186, -71.070728);
    station0169.mapLocation = CGPointMake(1777, 1416.5);
    station0169.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0201 = [[MWDrawFillCircle alloc] init];
    fillCircle0201.center = station0169.mapLocation;
    fillCircle0201.radius = 9.5;
    fillCircle0201.fillColor = [UIColor whiteColor];
    [station0169.drawPrimitives addObject:fillCircle0201];

    station0169.showNameOnMap = NO;
    [station0169.nameOriginalTextPrimitives addObject:drawTextLine0124];

    // Добавляем вершину
    edge0072.finishVertex = vertex0036;

    // Создаем участок линии Arlington - Boylston
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0073 = [[MWEdge alloc] init];
    edge0073.identifier = @"edge0073";
    edge0073.developmentName = @"Ребро: Arlington - Boylston";
    [self.edges addObject:edge0073];
    
    // Добавляем линию
    edge0073.line = line0011;
    
    // Добавляем вершину
    edge0073.startVertex = vertex0036;

    // Добавляем станцию Arlington
    [edge0073.elements addObject:station0169];
    
    // Добавляем перегон
    MWHaul *haul0163 = [[MWHaul alloc] init];
    haul0163.identifier = @"haul0163";
    haul0163.length = 502;
    [edge0073.elements addObject:haul0163];

    haul0163.showOnMap = NO;
    [haul0163.drawPrimitives addObject:drawLine0170];
    [haul0163.drawPrimitives addObject:drawArc0040];

    // Добавляем станцию Boylston
    MWStation *station0170 = [[MWStation alloc] init];
    station0170.identifier = @"station0170";
    [edge0073.elements addObject:station0170];
    
    station0170.nameOriginal = @"Boylston";
    station0170.geoLocation = CGPointMake(42.3525, -71.064722);
    station0170.mapLocation = CGPointMake(1915, 1411.5);
    station0170.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0202 = [[MWDrawFillCircle alloc] init];
    fillCircle0202.center = station0170.mapLocation;
    fillCircle0202.radius = 9.5;
    fillCircle0202.fillColor = [UIColor whiteColor];
    [station0170.drawPrimitives addObject:fillCircle0202];

    station0170.showNameOnMap = NO;
    [station0170.drawPrimitives addObject:fillCircle0158];

    // Добавляем вершину
    edge0073.finishVertex = vertex0025;

    // Создаем участок линии Boylston - Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0074 = [[MWEdge alloc] init];
    edge0074.identifier = @"edge0074";
    edge0074.developmentName = @"Ребро: Boylston - Park St";
    [self.edges addObject:edge0074];
    
    // Добавляем линию
    edge0074.line = line0011;
    
    // Добавляем вершину
    edge0074.startVertex = vertex0025;

    // Добавляем станцию Boylston
    [edge0074.elements addObject:station0170];
    
    // Добавляем перегон
    MWHaul *haul0164 = [[MWHaul alloc] init];
    haul0164.identifier = @"haul0164";
    haul0164.length = 487;
    [edge0074.elements addObject:haul0164];

    haul0164.showOnMap = NO;
    [haul0164.drawPrimitives addObject:drawArc0041];
    [haul0164.drawPrimitives addObject:drawLine0171];
    [haul0164.drawPrimitives addObject:drawTextLine0139];

    // Добавляем станцию Park St
    MWStation *station0171 = [[MWStation alloc] init];
    station0171.identifier = @"station0171";
    [edge0074.elements addObject:station0171];
    
    station0171.nameOriginal = @"Park Street";
    station0171.geoLocation = CGPointMake(42.356389, -71.0625);
    station0171.mapLocation = CGPointMake(2065.5, 1275.5);
    station0171.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0203 = [[MWDrawFillCircle alloc] init];
    fillCircle0203.center = station0171.mapLocation;
    fillCircle0203.radius = 16;
    fillCircle0203.fillColor = line0011.color;
    [station0171.drawPrimitives addObject:fillCircle0203];

    MWDrawFillCircle *fillCircle0204 = [[MWDrawFillCircle alloc] init];
    fillCircle0204.center = station0171.mapLocation;
    fillCircle0204.radius = 9.5;
    fillCircle0204.fillColor = [UIColor whiteColor];
    [station0171.drawPrimitives addObject:fillCircle0204];

    station0171.showNameOnMap = NO;
    [station0171.nameOriginalTextPrimitives addObject:drawTextLine0009];

    // Добавляем вершину
    edge0074.finishVertex = vertex0002;

    ////////////////////////////////////////////////////////////////
    // 12. Green Line E
    ////////////////////////////////////////////////////////////////
    
    // Создаем участок линии Heath - Copley
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0075 = [[MWEdge alloc] init];
    edge0075.identifier = @"edge0075";
    edge0075.developmentName = @"Ребро: Heath - Copley";
    [self.edges addObject:edge0075];
    
    // Добавляем линию
    edge0075.line = line0012;
    
    // Добавляем вершину
    edge0075.startVertex = vertex0038;

    // Добавляем станцию Heath
    MWStation *station0172 = [[MWStation alloc] init];
    station0172.identifier = @"station0172";
    [edge0075.elements addObject:station0172];
    
    station0172.nameOriginal = @"Heath Street";
    station0172.geoLocation = CGPointMake(42.32868, -71.11068);
    station0172.mapLocation = CGPointMake(1172, 2051);

    MWDrawFillCircle *fillCircle0205 = [[MWDrawFillCircle alloc] init];
    fillCircle0205.center = station0172.mapLocation;
    fillCircle0205.radius = 16;
    fillCircle0205.fillColor = line0012.color;
    [station0172.drawPrimitives addObject:fillCircle0205];

    MWDrawFillCircle *fillCircle0206 = [[MWDrawFillCircle alloc] init];
    fillCircle0206.center = station0172.mapLocation;
    fillCircle0206.radius = 9.5;
    fillCircle0206.fillColor = [UIColor whiteColor];
    [station0172.drawPrimitives addObject:fillCircle0206];

    MWDrawTextLine *drawTextLine0156 = [[MWDrawTextLine alloc] init];
    drawTextLine0156.text = @"HEATH";
    drawTextLine0156.fontName = @"Baskerville";
    drawTextLine0156.fontColor = [UIColor blackColor];
    drawTextLine0156.fontSize = 36;
    drawTextLine0156.origin = CGPointMake(992, 2028.5);
    drawTextLine0156.kernSpacing = -1.7;
    [station0172.nameOriginalTextPrimitives addObject:drawTextLine0156];

    // Добавляем перегон
    MWHaul *haul0165 = [[MWHaul alloc] init];
    haul0165.identifier = @"haul0165";
    haul0165.length = 188;
    [edge0075.elements addObject:haul0165];

    MWDrawLine *drawLine0205 = [[MWDrawLine alloc] init];
    drawLine0205.startPoint = CGPointMake(1172, 2051);
    drawLine0205.endPoint = CGPointMake(1214, 2008.5);
    drawLine0205.width = 32;
    drawLine0205.color = line0012.color;
    [haul0165.drawPrimitives addObject:drawLine0205];

    // Добавляем станцию Back of the Hill
    MWStation *station0173 = [[MWStation alloc] init];
    station0173.identifier = @"station0173";
    [edge0075.elements addObject:station0173];
    
    station0173.nameOriginal = @"Back of the Hill";
    station0173.geoLocation = CGPointMake(42.330278, -71.111389);
    station0173.mapLocation = CGPointMake(1214, 2008.5);

    MWDrawFillCircle *fillCircle0207 = [[MWDrawFillCircle alloc] init];
    fillCircle0207.center = station0173.mapLocation;
    fillCircle0207.radius = 9.5;
    fillCircle0207.fillColor = [UIColor whiteColor];
    [station0173.drawPrimitives addObject:fillCircle0207];

    MWDrawTextLine *drawTextLine0157 = [[MWDrawTextLine alloc] init];
    drawTextLine0157.text = station0173.nameOriginal;
    drawTextLine0157.fontName = @"Baskerville";
    drawTextLine0157.fontColor = [UIColor blackColor];
    drawTextLine0157.fontSize = 34;
    drawTextLine0157.origin = CGPointMake(980, 1978.5);
    drawTextLine0157.kernSpacing = - 1.6;
    [station0173.nameOriginalTextPrimitives addObject:drawTextLine0157];

    // Добавляем перегон
    MWHaul *haul0166 = [[MWHaul alloc] init];
    haul0166.identifier = @"haul0166";
    haul0166.length = 166;
    [edge0075.elements addObject:haul0166];

    MWDrawLine *drawLine0206 = [[MWDrawLine alloc] init];
    drawLine0206.startPoint = CGPointMake(1213.5, 2009);
    drawLine0206.endPoint = CGPointMake(1258, 1965.5);
    drawLine0206.width = 32;
    drawLine0206.color = line0012.color;
    [haul0166.drawPrimitives addObject:drawLine0206];

    // Добавляем станцию Riverway
    MWStation *station0174 = [[MWStation alloc] init];
    station0174.identifier = @"station0174";
    [edge0075.elements addObject:station0174];
    
    station0174.nameOriginal = @"Riverway";
    station0174.geoLocation = CGPointMake(42.331694, -71.112);
    station0174.mapLocation = CGPointMake(1258, 1965.5);

    MWDrawFillCircle *fillCircle0208 = [[MWDrawFillCircle alloc] init];
    fillCircle0208.center = station0174.mapLocation;
    fillCircle0208.radius = 9.5;
    fillCircle0208.fillColor = [UIColor whiteColor];
    [station0174.drawPrimitives addObject:fillCircle0208];

    MWDrawTextLine *drawTextLine0158 = [[MWDrawTextLine alloc] init];
    drawTextLine0158.text = station0174.nameOriginal;
    drawTextLine0158.fontName = @"Baskerville";
    drawTextLine0158.fontColor = [UIColor blackColor];
    drawTextLine0158.fontSize = 34;
    drawTextLine0158.origin = CGPointMake(1100, 1935);
    drawTextLine0158.kernSpacing = - 1.6;
    [station0174.nameOriginalTextPrimitives addObject:drawTextLine0158];

    // Добавляем перегон
    MWHaul *haul0167 = [[MWHaul alloc] init];
    haul0167.identifier = @"haul0167";
    haul0167.length = 269;
    [edge0075.elements addObject:haul0167];

    MWDrawLine *drawLine0207 = [[MWDrawLine alloc] init];
    drawLine0207.startPoint = CGPointMake(1257.5, 1966);
    drawLine0207.endPoint = CGPointMake(1299.5, 1924);
    drawLine0207.width = 32;
    drawLine0207.color = line0012.color;
    [haul0167.drawPrimitives addObject:drawLine0207];

    // Добавляем станцию Mission Park
    MWStation *station0175 = [[MWStation alloc] init];
    station0175.identifier = @"station0175";
    [edge0075.elements addObject:station0175];
    
    station0175.nameOriginal = @"Mission Park";
    station0175.geoLocation = CGPointMake(42.333172, -71.109746);
    station0175.mapLocation = CGPointMake(1299.5, 1924);
    
    MWDrawFillCircle *fillCircle0209 = [[MWDrawFillCircle alloc] init];
    fillCircle0209.center = station0175.mapLocation;
    fillCircle0209.radius = 9.5;
    fillCircle0209.fillColor = [UIColor whiteColor];
    [station0175.drawPrimitives addObject:fillCircle0209];

    MWDrawTextLine *drawTextLine0159 = [[MWDrawTextLine alloc] init];
    drawTextLine0159.text = station0175.nameOriginal;
    drawTextLine0159.fontName = @"Baskerville";
    drawTextLine0159.fontColor = [UIColor blackColor];
    drawTextLine0159.fontSize = 34;
    drawTextLine0159.origin = CGPointMake(1095.5, 1890);
    drawTextLine0159.kernSpacing = - 1.5;
    [station0175.nameOriginalTextPrimitives addObject:drawTextLine0159];

    // Добавляем перегон
    MWHaul *haul0168 = [[MWHaul alloc] init];
    haul0168.identifier = @"haul0168";
    haul0168.length = 348;
    [edge0075.elements addObject:haul0168];

    MWDrawLine *drawLine0208 = [[MWDrawLine alloc] init];
    drawLine0208.startPoint = CGPointMake(1299, 1924.5);
    drawLine0208.endPoint = CGPointMake(1342, 1881.5);
    drawLine0208.width = 32;
    drawLine0208.color = line0012.color;
    [haul0168.drawPrimitives addObject:drawLine0208];

    // Добавляем станцию Fenwood Rd
    MWStation *station0176 = [[MWStation alloc] init];
    station0176.identifier = @"station0176";
    [edge0075.elements addObject:station0176];
    
    station0176.nameOriginal = @"Fenwood Road";
    station0176.geoLocation = CGPointMake(42.33368, -71.1057);
    station0176.mapLocation = CGPointMake(1342, 1881.5);

    MWDrawFillCircle *fillCircle0210 = [[MWDrawFillCircle alloc] init];
    fillCircle0210.center = station0176.mapLocation;
    fillCircle0210.radius = 9.5;
    fillCircle0210.fillColor = [UIColor whiteColor];
    [station0176.drawPrimitives addObject:fillCircle0210];
    
    MWDrawTextLine *drawTextLine0160 = [[MWDrawTextLine alloc] init];
    drawTextLine0160.text = @"Fenwood Rd";
    drawTextLine0160.fontName = @"Baskerville";
    drawTextLine0160.fontColor = [UIColor blackColor];
    drawTextLine0160.fontSize = 34;
    drawTextLine0160.origin = CGPointMake(1134, 1852);
    drawTextLine0160.kernSpacing = - 2.0;
    [station0176.nameOriginalTextPrimitives addObject:drawTextLine0160];

    // Добавляем перегон
    MWHaul *haul0169 = [[MWHaul alloc] init];
    haul0169.identifier = @"haul0169";
    haul0169.length = 106;
    [edge0075.elements addObject:haul0169];

    MWDrawLine *drawLine0209 = [[MWDrawLine alloc] init];
    drawLine0209.startPoint = CGPointMake(1341.5, 1882);
    drawLine0209.endPoint = CGPointMake(1385.5, 1837.5);
    drawLine0209.width = 32;
    drawLine0209.color = line0012.color;
    [haul0169.drawPrimitives addObject:drawLine0209];

    // Добавляем станцию Brigham Circle
    MWStation *station0177 = [[MWStation alloc] init];
    station0177.identifier = @"station0177";
    [edge0075.elements addObject:station0177];
    
    station0177.nameOriginal = @"Brigham Circle";
    station0177.geoLocation = CGPointMake(42.334169, -71.104567);
    station0177.mapLocation = CGPointMake(1385.5, 1837.5);

    MWDrawFillCircle *fillCircle0211 = [[MWDrawFillCircle alloc] init];
    fillCircle0211.center = station0177.mapLocation;
    fillCircle0211.radius = 9.5;
    fillCircle0211.fillColor = [UIColor whiteColor];
    [station0177.drawPrimitives addObject:fillCircle0211];
    
    MWDrawTextLine *drawTextLine0161 = [[MWDrawTextLine alloc] init];
    drawTextLine0161.text = station0177.nameOriginal;
    drawTextLine0161.fontName = @"Baskerville";
    drawTextLine0161.fontColor = [UIColor blackColor];
    drawTextLine0161.fontSize = 34;
    drawTextLine0161.origin = CGPointMake(1124, 1808);
    drawTextLine0161.kernSpacing = - 1.6;
    [station0177.nameOriginalTextPrimitives addObject:drawTextLine0161];

    // Добавляем перегон
    MWHaul *haul0170 = [[MWHaul alloc] init];
    haul0170.identifier = @"haul0170";
    haul0170.length = 428;
    [edge0075.elements addObject:haul0170];

    MWDrawLine *drawLine0210 = [[MWDrawLine alloc] init];
    drawLine0210.startPoint = CGPointMake(1385, 1838);
    drawLine0210.endPoint = CGPointMake(1427.5, 1796);
    drawLine0210.width = 32;
    drawLine0210.color = line0012.color;
    [haul0170.drawPrimitives addObject:drawLine0210];

    // Добавляем станцию Longwood Medical Area
    MWStation *station0178 = [[MWStation alloc] init];
    station0178.identifier = @"station0178";
    [edge0075.elements addObject:station0178];
    
    station0178.nameOriginal = @"Longwood Medical Area";
    station0178.geoLocation = CGPointMake(42.33595, -71.10002);
    station0178.mapLocation = CGPointMake(1427.5, 1796);

    MWDrawFillCircle *fillCircle0212 = [[MWDrawFillCircle alloc] init];
    fillCircle0212.center = station0178.mapLocation;
    fillCircle0212.radius = 9.5;
    fillCircle0212.fillColor = [UIColor whiteColor];
    [station0178.drawPrimitives addObject:fillCircle0212];
    
    MWDrawTextLine *drawTextLine0162 = [[MWDrawTextLine alloc] init];
    drawTextLine0162.text = station0178.nameOriginal;
    drawTextLine0162.fontName = @"Baskerville";
    drawTextLine0162.fontColor = [UIColor blackColor];
    drawTextLine0162.fontSize = 34;
    drawTextLine0162.origin = CGPointMake(1039, 1766);
    drawTextLine0162.kernSpacing = - 1.9;
    [station0178.nameOriginalTextPrimitives addObject:drawTextLine0162];

    // Добавляем перегон
    MWHaul *haul0171 = [[MWHaul alloc] init];
    haul0171.identifier = @"haul0171";
    haul0171.length = 415;
    [edge0075.elements addObject:haul0171];

    MWDrawLine *drawLine0211 = [[MWDrawLine alloc] init];
    drawLine0211.startPoint = CGPointMake(1427, 1796.5);
    drawLine0211.endPoint = CGPointMake(1470, 1753.5);
    drawLine0211.width = 32;
    drawLine0211.color = line0012.color;
    [haul0171.drawPrimitives addObject:drawLine0211];

    // Добавляем станцию Museum of Fine Arts
    MWStation *station0179 = [[MWStation alloc] init];
    station0179.identifier = @"station0179";
    [edge0075.elements addObject:station0179];
    
    station0179.nameOriginal = @"Museum of Fine Arts";
    station0179.geoLocation = CGPointMake(42.337674, -71.095533);
    station0179.mapLocation = CGPointMake(1470, 1753.5);

    MWDrawFillCircle *fillCircle0213 = [[MWDrawFillCircle alloc] init];
    fillCircle0213.center = station0179.mapLocation;
    fillCircle0213.radius = 9.5;
    fillCircle0213.fillColor = [UIColor whiteColor];
    [station0179.drawPrimitives addObject:fillCircle0213];
    
    MWDrawTextLine *drawTextLine0163 = [[MWDrawTextLine alloc] init];
    drawTextLine0163.text = station0179.nameOriginal;
    drawTextLine0163.fontName = @"Baskerville";
    drawTextLine0163.fontColor = [UIColor blackColor];
    drawTextLine0163.fontSize = 34;
    drawTextLine0163.origin = CGPointMake(1131.5, 1721);
    drawTextLine0163.kernSpacing = - 2.1;
    [station0179.nameOriginalTextPrimitives addObject:drawTextLine0163];

    // Добавляем перегон
    MWHaul *haul0172 = [[MWHaul alloc] init];
    haul0172.identifier = @"haul0172";
    haul0172.length = 489;
    [edge0075.elements addObject:haul0172];

    MWDrawLine *drawLine0212 = [[MWDrawLine alloc] init];
    drawLine0212.startPoint = CGPointMake(1469.5, 1754);
    drawLine0212.endPoint = CGPointMake(1512.5, 1711);
    drawLine0212.width = 32;
    drawLine0212.color = line0012.color;
    [haul0172.drawPrimitives addObject:drawLine0212];

    // Добавляем станцию Northeastern
    MWStation *station0180 = [[MWStation alloc] init];
    station0180.identifier = @"station0180";
    [edge0075.elements addObject:station0180];
    
    station0180.nameOriginal = @"Northeastern University";
    station0180.geoLocation = CGPointMake(42.33976, -71.09033);
    station0180.mapLocation = CGPointMake(1512.5, 1711);

    MWDrawFillCircle *fillCircle0214 = [[MWDrawFillCircle alloc] init];
    fillCircle0214.center = station0180.mapLocation;
    fillCircle0214.radius = 9.5;
    fillCircle0214.fillColor = [UIColor whiteColor];
    [station0180.drawPrimitives addObject:fillCircle0214];

    MWDrawTextLine *drawTextLine0164 = [[MWDrawTextLine alloc] init];
    drawTextLine0164.text = @"Northeastern";
    drawTextLine0164.fontName = @"Baskerville";
    drawTextLine0164.fontColor = [UIColor blackColor];
    drawTextLine0164.fontSize = 34;
    drawTextLine0164.origin = CGPointMake(1278, 1679);
    drawTextLine0164.kernSpacing = - 2.2;
    [station0180.nameOriginalTextPrimitives addObject:drawTextLine0164];

    // Добавляем перегон
    MWHaul *haul0173 = [[MWHaul alloc] init];
    haul0173.identifier = @"haul0173";
    haul0173.length = 561;
    [edge0075.elements addObject:haul0173];

    MWDrawLine *drawLine0213 = [[MWDrawLine alloc] init];
    drawLine0213.startPoint = CGPointMake(1512, 1711.5);
    drawLine0213.endPoint = CGPointMake(1529.5, 1693);
    drawLine0213.width = 32;
    drawLine0213.color = line0012.color;
    [haul0173.drawPrimitives addObject:drawLine0213];

    MWDrawArc *drawArc0048 = [[MWDrawArc alloc] init];
    drawArc0048.center = CGPointMake(1472, 1637.5);
    drawArc0048.startRadians = 18.5 * M_PI / 180; // 0
    drawArc0048.endRadians = 45 * M_PI / 180;
    drawArc0048.radius = 80;
    drawArc0048.width = 32;
    drawArc0048.color = line0012.color;
    [haul0173.drawPrimitives addObject:drawArc0048];

    // Добавляем станцию Symphony
    MWStation *station0181 = [[MWStation alloc] init];
    station0181.identifier = @"station0181";
    [edge0075.elements addObject:station0181];
    
    station0181.nameOriginal = @"Symphony";
    station0181.geoLocation = CGPointMake(42.342778, -71.085);
    station0181.mapLocation = CGPointMake(1546.5, 1664.5);
    
    MWDrawFillCircle *fillCircle0215 = [[MWDrawFillCircle alloc] init];
    fillCircle0215.center = station0181.mapLocation;
    fillCircle0215.radius = 9.5;
    fillCircle0215.fillColor = [UIColor whiteColor];
    [station0181.drawPrimitives addObject:fillCircle0215];
    
    MWDrawTextLine *drawTextLine0165 = [[MWDrawTextLine alloc] init];
    drawTextLine0165.text = station0181.nameOriginal;
    drawTextLine0165.fontName = @"Baskerville";
    drawTextLine0165.fontColor = [UIColor blackColor];
    drawTextLine0165.fontSize = 34;
    drawTextLine0165.origin = CGPointMake(1370, 1639);
    drawTextLine0165.kernSpacing = - 2.4;
    [station0181.nameOriginalTextPrimitives addObject:drawTextLine0165];
    
    // Добавляем перегон
    MWHaul *haul0174 = [[MWHaul alloc] init];
    haul0174.identifier = @"haul0174";
    haul0174.length = 412;
    [edge0075.elements addObject:haul0174];

    MWDrawArc *drawArc0049 = [[MWDrawArc alloc] init];
    drawArc0049.center = CGPointMake(1472, 1637.5);
    drawArc0049.startRadians = 0 * M_PI / 180;
    drawArc0049.endRadians = 19 * M_PI / 180;
    drawArc0049.radius = 80;
    drawArc0049.width = 32;
    drawArc0049.color = line0012.color;
    [haul0174.drawPrimitives addObject:drawArc0049];

    MWDrawLine *drawLine0214 = [[MWDrawLine alloc] init];
    drawLine0214.startPoint = CGPointMake(1552, 1638);
    drawLine0214.endPoint = CGPointMake(1552, 1503);
    drawLine0214.width = 32;
    drawLine0214.color = line0012.color;
    [haul0174.drawPrimitives addObject:drawLine0214];

    // Добавляем станцию Prudential
    MWStation *station0182 = [[MWStation alloc] init];
    station0182.identifier = @"station0182";
    [edge0075.elements addObject:station0182];
    
    station0182.nameOriginal = @"Prudential";
    station0182.geoLocation = CGPointMake(42.345556, -71.081667);
    station0182.mapLocation = CGPointMake(1552, 1503);

    MWDrawFillCircle *fillCircle0216 = [[MWDrawFillCircle alloc] init];
    fillCircle0216.center = station0182.mapLocation;
    fillCircle0216.radius = 9.5;
    fillCircle0216.fillColor = [UIColor whiteColor];
    [station0182.drawPrimitives addObject:fillCircle0216];

    MWDrawTextLine *drawTextLine0166 = [[MWDrawTextLine alloc] init];
    drawTextLine0166.text = station0182.nameOriginal;
    drawTextLine0166.fontName = @"Baskerville";
    drawTextLine0166.fontColor = [UIColor blackColor];
    drawTextLine0166.fontSize = 34;
    drawTextLine0166.origin = CGPointMake(1360, 1482);
    drawTextLine0166.kernSpacing = - 1.9;
    [station0182.nameOriginalTextPrimitives addObject:drawTextLine0166];

    // Добавляем перегон
    MWHaul *haul0175 = [[MWHaul alloc] init];
    haul0175.identifier = @"haul0175";
    haul0175.length = 628;
    [edge0075.elements addObject:haul0175];

    MWDrawLine *drawLine0215 = [[MWDrawLine alloc] init];
    drawLine0215.startPoint = CGPointMake(1552, 1503.5);
    drawLine0215.endPoint = CGPointMake(1552, 1495);
    drawLine0215.width = 32;
    drawLine0215.color = line0012.color;
    [haul0175.drawPrimitives addObject:drawLine0215];

    MWDrawArc *drawArc0050 = [[MWDrawArc alloc] init];
    drawArc0050.center = CGPointMake(1632, 1496);
    drawArc0050.startRadians = 180 * M_PI / 180;
    drawArc0050.endRadians = 270 * M_PI / 180;
    drawArc0050.radius = 80;
    drawArc0050.width = 32;
    drawArc0050.color = line0012.color;
    [haul0175.drawPrimitives addObject:drawArc0050];

    MWDrawLine *drawLine0216 = [[MWDrawLine alloc] init];
    drawLine0216.startPoint = CGPointMake(1631, 1416);
    drawLine0216.endPoint = CGPointMake(1639, 1416);
    drawLine0216.width = 32;
    drawLine0216.color = line0012.color;
    [haul0175.drawPrimitives addObject:drawLine0216];

    // Добавляем станцию Copley
    MWStation *station0183 = [[MWStation alloc] init];
    station0183.identifier = @"station0183";
    [edge0075.elements addObject:station0183];
    
    station0183.nameOriginal = @"Copley";
    station0183.geoLocation = CGPointMake(42.350278, -71.0775);
    station0183.mapLocation = CGPointMake(1639, 1416);
    station0183.platformIndex = 1;

    MWDrawFillCircle *fillCircle0217 = [[MWDrawFillCircle alloc] init];
    fillCircle0217.center = station0183.mapLocation;
    fillCircle0217.radius = 9.5;
    fillCircle0217.fillColor = [UIColor whiteColor];
    [station0183.drawPrimitives addObject:fillCircle0217];

    station0183.showNameOnMap = NO;
    [station0183.nameOriginalTextPrimitives addObject:drawTextLine0123];

    // Добавляем вершину
    edge0075.finishVertex = vertex0037;

    // Создаем участок линии Copley - Arlington
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0076 = [[MWEdge alloc] init];
    edge0076.identifier = @"edge0076";
    edge0076.developmentName = @"Ребро: Copley - Arlington";
    [self.edges addObject:edge0076];
    
    // Добавляем линию
    edge0076.line = line0012;
    
    // Добавляем вершину
    edge0076.startVertex = vertex0037;

    // Добавляем станцию Copley
    [edge0076.elements addObject:station0183];

    // Добавляем перегон
    MWHaul *haul0176 = [[MWHaul alloc] init];
    haul0176.identifier = @"haul0176";
    haul0176.length = 590;
    [edge0076.elements addObject:haul0176];

    haul0176.showOnMap = NO;
    [haul0176.drawPrimitives addObject:drawLine0169];

    // Добавляем станцию Arlington
    MWStation *station0184 = [[MWStation alloc] init];
    station0184.identifier = @"station0184";
    [edge0076.elements addObject:station0184];
    
    station0184.nameOriginal = @"Arlington";
    station0184.geoLocation = CGPointMake(42.35186, -71.070728);
    station0184.mapLocation = CGPointMake(1777, 1416.5);
    station0184.platformIndex = 1;

    MWDrawFillCircle *fillCircle0218 = [[MWDrawFillCircle alloc] init];
    fillCircle0218.center = station0184.mapLocation;
    fillCircle0218.radius = 9.5;
    fillCircle0218.fillColor = [UIColor whiteColor];
    [station0184.drawPrimitives addObject:fillCircle0218];

    station0184.showNameOnMap = NO;
    [station0184.nameOriginalTextPrimitives addObject:drawTextLine0124];

    // Добавляем вершину
    edge0076.finishVertex = vertex0036;

    // Создаем участок линии Arlington - Boylston
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0077 = [[MWEdge alloc] init];
    edge0077.identifier = @"edge0077";
    edge0077.developmentName = @"Ребро: Arlington - Boylston";
    [self.edges addObject:edge0077];
    
    // Добавляем линию
    edge0077.line = line0012;
    
    // Добавляем вершину
    edge0077.startVertex = vertex0036;

    // Добавляем станцию Arlington
    [edge0077.elements addObject:station0184];

    // Добавляем перегон
    MWHaul *haul0177 = [[MWHaul alloc] init];
    haul0177.identifier = @"haul0177";
    haul0177.length = 502;
    [edge0077.elements addObject:haul0177];
    
    haul0177.showOnMap = NO;
    [haul0177.drawPrimitives addObject:drawLine0170];
    [haul0177.drawPrimitives addObject:drawArc0040];

    // Добавляем станцию Boylston
    MWStation *station0185 = [[MWStation alloc] init];
    station0185.identifier = @"station0185";
    [edge0077.elements addObject:station0185];
    
    station0185.nameOriginal = @"Boylston";
    station0185.geoLocation = CGPointMake(42.3525, -71.064722);
    station0185.mapLocation = CGPointMake(1915, 1411.5);
    station0185.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0219 = [[MWDrawFillCircle alloc] init];
    fillCircle0219.center = station0185.mapLocation;
    fillCircle0219.radius = 9.5;
    fillCircle0219.fillColor = [UIColor whiteColor];
    [station0185.drawPrimitives addObject:fillCircle0219];

    station0185.showNameOnMap = NO;
    [station0185.drawPrimitives addObject:fillCircle0158];

    // Добавляем вершину
    edge0077.finishVertex = vertex0025;

    // Создаем участок линии Boylston - Park St
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0078 = [[MWEdge alloc] init];
    edge0078.identifier = @"edge0078";
    edge0078.developmentName = @"Ребро: Boylston - Park St";
    [self.edges addObject:edge0078];
    
    // Добавляем линию
    edge0078.line = line0012;
    
    // Добавляем вершину
    edge0078.startVertex = vertex0025;

    // Добавляем станцию Boylston
    [edge0078.elements addObject:station0185];

    // Добавляем перегон
    MWHaul *haul0178 = [[MWHaul alloc] init];
    haul0178.identifier = @"haul0178";
    haul0178.length = 487;
    [edge0078.elements addObject:haul0178];
    
    haul0178.showOnMap = NO;
    [haul0178.drawPrimitives addObject:drawArc0041];
    [haul0178.drawPrimitives addObject:drawLine0171];
    [haul0178.drawPrimitives addObject:drawTextLine0139];

    // Добавляем станцию Park St
    MWStation *station0186 = [[MWStation alloc] init];
    station0186.identifier = @"station0186";
    [edge0078.elements addObject:station0186];
    
    station0186.nameOriginal = @"Park Street";
    station0186.geoLocation = CGPointMake(42.356389, -71.0625);
    station0186.mapLocation = CGPointMake(2065.5, 1275.5);
    station0186.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0220 = [[MWDrawFillCircle alloc] init];
    fillCircle0220.center = station0186.mapLocation;
    fillCircle0220.radius = 9.5;
    fillCircle0220.fillColor = [UIColor whiteColor];
    [station0186.drawPrimitives addObject:fillCircle0220];

    station0186.showNameOnMap = NO;
    [station0186.nameOriginalTextPrimitives addObject:drawTextLine0009];

    // Добавляем вершину
    edge0078.finishVertex = vertex0002;

    // Создаем участок линии Park St - Gov’t. Ctr
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0079 = [[MWEdge alloc] init];
    edge0079.identifier = @"edge0079";
    edge0079.developmentName = @"Ребро: Park St - Gov’t. Ctr";
    [self.edges addObject:edge0079];
    
    // Добавляем линию
    edge0079.line = line0012;
    
    // Добавляем вершину
    edge0079.startVertex = vertex0002;

    // Добавляем станцию Park St
    [edge0079.elements addObject:station0186];

    // Добавляем перегон
    MWHaul *haul0179 = [[MWHaul alloc] init];
    haul0179.identifier = @"haul0179";
    haul0179.length = 432;
    [edge0079.elements addObject:haul0179];
    
    haul0179.showOnMap = NO;
    [haul0179.drawPrimitives addObject:drawLine0187];
    [haul0179.drawPrimitives addObject:drawTextLine0140];
    
    // Добавляем станцию Gov’t. Ctr
    MWStation *station0187 = [[MWStation alloc] init];
    station0187.identifier = @"station0187";
    [edge0079.elements addObject:station0187];
    
    station0187.nameOriginal = @"Government Center";
    station0187.geoLocation = CGPointMake(42.359444, -71.059444);
    station0187.mapLocation = CGPointMake(2167.5, 1172.5);
    station0187.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0221 = [[MWDrawFillCircle alloc] init];
    fillCircle0221.center = station0187.mapLocation;
    fillCircle0221.radius = 5;
    fillCircle0221.fillColor = [UIColor whiteColor];
    [station0187.drawPrimitives addObject:fillCircle0221];

    station0187.showNameOnMap = NO;
    [station0187.nameOriginalTextPrimitives addObject:drawTextLine0057];
    [station0187.nameOriginalTextPrimitives addObject:drawTextLine0058];
    [station0187.nameOriginalTextPrimitives addObject:drawTextLine0059];

    // Добавляем вершину
    edge0079.finishVertex = vertex0017;

    // Создаем участок линии Gov’t. Ctr - Haymarket
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0080 = [[MWEdge alloc] init];
    edge0080.identifier = @"edge0080";
    edge0080.developmentName = @"Ребро: Gov’t. Ctr - Haymarket";
    [self.edges addObject:edge0080];
    
    // Добавляем линию
    edge0080.line = line0012;
    
    // Добавляем вершину
    edge0080.startVertex = vertex0017;

    // Добавляем станцию Gov’t. Ctr
    [edge0080.elements addObject:station0187];

    // Добавляем перегон
    MWHaul *haul0180 = [[MWHaul alloc] init];
    haul0180.identifier = @"haul0180";
    haul0180.length = 450;
    [edge0080.elements addObject:haul0180];

    haul0180.showOnMap = NO;
    [haul0180.drawPrimitives addObject:drawLine0188];
    [haul0180.drawPrimitives addObject:drawTextLine0141];

    // Добавляем станцию Haymarket
    MWStation *station0188 = [[MWStation alloc] init];
    station0188.identifier = @"station0188";
    [edge0080.elements addObject:station0188];
    
    station0188.nameOriginal = @"Haymarket";
    station0188.geoLocation = CGPointMake(42.3633, -71.0582);
    station0188.mapLocation = CGPointMake(2270, 1070.5);
    station0188.platformIndex = 1;
    
    MWDrawFillCircle *fillCircle0222 = [[MWDrawFillCircle alloc] init];
    fillCircle0222.center = station0188.mapLocation;
    fillCircle0222.radius = 9.5;
    fillCircle0222.fillColor = [UIColor whiteColor];
    [station0188.drawPrimitives addObject:fillCircle0222];

    station0188.showNameOnMap = NO;
    [station0188.drawPrimitives addObject:drawLine0056];
    [station0188.nameOriginalTextPrimitives addObject:drawTextLine0047];

    // Добавляем вершину
    edge0080.finishVertex = vertex0013;

    // Создаем участок линии Haymarket - North Station
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0081 = [[MWEdge alloc] init];
    edge0081.identifier = @"edge0081";
    edge0081.developmentName = @"Ребро: Haymarket - North Station";
    [self.edges addObject:edge0081];
    
    // Добавляем линию
    edge0081.line = line0012;
    
    // Добавляем вершину
    edge0081.startVertex = vertex0013;

    // Добавляем станцию Haymarket
    [edge0081.elements addObject:station0188];

    // Добавляем перегон
    MWHaul *haul0181 = [[MWHaul alloc] init];
    haul0181.identifier = @"haul0181";
    haul0181.length = 370;
    [edge0081.elements addObject:haul0181];

    haul0181.showOnMap = NO;
    [haul0181.drawPrimitives addObject:drawLine0189];
    [haul0181.drawPrimitives addObject:drawArc0045];
    [haul0181.drawPrimitives addObject:drawLine0190];
    [haul0181.drawPrimitives addObject:drawTextLine0142];

    // Добавляем станцию North Station
    MWStation *station0189 = [[MWStation alloc] init];
    station0189.identifier = @"station0189";
    [edge0081.elements addObject:station0189];
    
    station0189.nameOriginal = @"North Station";
    station0189.geoLocation = CGPointMake(42.3657, -71.061);
    station0189.mapLocation = CGPointMake(2269.5, 906.5);
    station0189.platformIndex = 1;

    MWDrawFillCircle *fillCircle0223 = [[MWDrawFillCircle alloc] init];
    fillCircle0223.center = station0189.mapLocation;
    fillCircle0223.radius = 9.5;
    fillCircle0223.fillColor = [UIColor whiteColor];
    [station0189.drawPrimitives addObject:fillCircle0223];

    station0189.showNameOnMap = NO;
    [station0189.nameOriginalTextPrimitives addObject:drawTextLine0048];

    // Добавляем вершину
    edge0081.finishVertex = vertex0014;

    // Создаем участок линии North Station - Lechmere
    ////////////////////////////////////////////////////////////////
    MWEdge *edge0082 = [[MWEdge alloc] init];
    edge0082.identifier = @"edge0082";
    edge0082.developmentName = @"Ребро: North Station - Lechmere";
    [self.edges addObject:edge0082];
    
    // Добавляем линию
    edge0082.line = line0012;
    
    // Добавляем вершину
    edge0082.startVertex = vertex0014;

    // Добавляем станцию North Station
    [edge0082.elements addObject:station0189];

    // Добавляем перегон
    MWHaul *haul0182 = [[MWHaul alloc] init];
    haul0182.identifier = @"haul0182";
    haul0182.length = 2100;
    [edge0082.elements addObject:haul0182];
    
    MWDrawLine *drawLine0217 = [[MWDrawLine alloc] init];
    drawLine0217.startPoint = CGPointMake(2270, 907);
    drawLine0217.endPoint = CGPointMake(2216, 852.5);
    drawLine0217.width = 32;
    drawLine0217.color = line0012.color;
    [haul0182.drawPrimitives addObject:drawLine0217];

    MWDrawTextLine *drawTextLine0167 = [[MWDrawTextLine alloc] init];
    drawTextLine0167.text = @"E";
    drawTextLine0167.fontName = @"Baskerville";
    drawTextLine0167.fontColor = [UIColor whiteColor];
    drawTextLine0167.fontSize = 20;
    drawTextLine0167.origin = CGPointMake(2244, 864);
    drawTextLine0167.kernSpacing = 0.5;
    drawTextLine0167.degrees = 45;
    [haul0182.drawPrimitives addObject:drawTextLine0167];

    // Добавляем станцию Science Park/West End
    MWStation *station0190 = [[MWStation alloc] init];
    station0190.identifier = @"station0190";
    [edge0082.elements addObject:station0190];
    
    station0190.nameOriginal = @"Science Park/West End";
    station0190.geoLocation = CGPointMake(42.366667, -71.067639);
    station0190.mapLocation = CGPointMake(2216, 852.5);

    MWDrawFillCircle *fillCircle0224 = [[MWDrawFillCircle alloc] init];
    fillCircle0224.center = station0190.mapLocation;
    fillCircle0224.radius = 9.5;
    fillCircle0224.fillColor = [UIColor whiteColor];
    [station0190.drawPrimitives addObject:fillCircle0224];

    MWDrawTextLine *drawTextLine0168 = [[MWDrawTextLine alloc] init];
    drawTextLine0168.text = @"Science Park/  West End";
    drawTextLine0168.fontName = @"Baskerville";
    drawTextLine0168.fontColor = [UIColor blackColor];
    drawTextLine0168.fontSize = 34;
    drawTextLine0168.origin = CGPointMake(1838, 840);
    drawTextLine0168.kernSpacing = - 1.7;
    [station0190.nameOriginalTextPrimitives addObject:drawTextLine0168];

    // Добавляем перегон
    MWHaul *haul0183 = [[MWHaul alloc] init];
    haul0183.identifier = @"haul0183";
    haul0183.length = 904;
    [edge0082.elements addObject:haul0183];
    
    MWDrawLine *drawLine0218 = [[MWDrawLine alloc] init];
    drawLine0218.startPoint = CGPointMake(2216.5, 853);
    drawLine0218.endPoint = CGPointMake(2155, 792);
    drawLine0218.width = 32;
    drawLine0218.color = line0012.color;
    [haul0183.drawPrimitives addObject:drawLine0218];

    MWDrawTextLine *drawTextLine0169 = [[MWDrawTextLine alloc] init];
    drawTextLine0169.text = @"E";
    drawTextLine0169.fontName = @"Baskerville";
    drawTextLine0169.fontColor = [UIColor whiteColor];
    drawTextLine0169.fontSize = 20;
    drawTextLine0169.origin = CGPointMake(2189, 810);
    drawTextLine0169.kernSpacing = 0.5;
    drawTextLine0169.degrees = 45;
    [haul0183.drawPrimitives addObject:drawTextLine0169];

    // Добавляем станцию Lechmere
    MWStation *station0191 = [[MWStation alloc] init];
    station0191.identifier = @"station0191";
    [edge0082.elements addObject:station0191];
    
    station0191.nameOriginal = @"Lechmere";
    station0191.geoLocation = CGPointMake(42.370917, -71.0775);
    station0191.mapLocation = CGPointMake(2155, 792);

    MWDrawFillCircle *fillCircle0225 = [[MWDrawFillCircle alloc] init];
    fillCircle0225.center = station0191.mapLocation;
    fillCircle0225.radius = 16;
    fillCircle0225.fillColor = line0012.color;
    [station0191.drawPrimitives addObject:fillCircle0225];
    
    MWDrawFillCircle *fillCircle0226 = [[MWDrawFillCircle alloc] init];
    fillCircle0226.center = station0191.mapLocation;
    fillCircle0226.radius = 9.5;
    fillCircle0226.fillColor = [UIColor whiteColor];
    [station0191.drawPrimitives addObject:fillCircle0226];

    MWDrawTextLine *drawTextLine0170 = [[MWDrawTextLine alloc] init];
    drawTextLine0170.text = @"LECHMERE";
    drawTextLine0170.fontName = @"Baskerville";
    drawTextLine0170.fontColor = [UIColor blackColor];
    drawTextLine0170.fontSize = 36;
    drawTextLine0170.origin = CGPointMake(1899, 774);
    drawTextLine0170.kernSpacing = -1.2;
    [station0191.nameOriginalTextPrimitives addObject:drawTextLine0170];

    // Добавляем вершину
    edge0082.finishVertex = vertex0035;

    // Дополнительные объекты
    
    // Red Line

    MWDrawArc *drawArc0051 = [[MWDrawArc alloc] init];
    drawArc0051.center = CGPointMake(1291, 663);
    drawArc0051.startRadians = 270 * M_PI / 180;
    drawArc0051.endRadians = 315 * M_PI / 180;
    drawArc0051.radius = 150;
    drawArc0051.width = 9;
    drawArc0051.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawArc0051];

    MWDrawArc *drawArc0052 = [[MWDrawArc alloc] init];
    drawArc0052.center = CGPointMake(1291, 663);
    drawArc0052.startRadians = 270 * M_PI / 180;
    drawArc0052.endRadians = 315 * M_PI / 180;
    drawArc0052.radius = 150;
    drawArc0052.width = 4.5;
    drawArc0052.color = [UIColor colorWithRed:(186/255.0) green:(146/255.0) blue:(131/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0052];

    MWDrawLine *drawLine0273 = [[MWDrawLine alloc] init];
    drawLine0273.startPoint = CGPointMake(952, 513);
    drawLine0273.endPoint = CGPointMake(1291, 513);
    drawLine0273.width = 9;
    drawLine0273.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0273];

    MWDrawLine *drawLine0272 = [[MWDrawLine alloc] init];
    drawLine0272.startPoint = CGPointMake(952, 513);
    drawLine0272.endPoint = CGPointMake(1291, 513);
    drawLine0272.width = 4.5;
    drawLine0272.color = [UIColor colorWithRed:(186/255.0) green:(146/255.0) blue:(131/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0272];

    MWDrawLine *drawLine0274 = [[MWDrawLine alloc] init];
    drawLine0274.startPoint = CGPointMake(1396.5, 556.5);
    drawLine0274.endPoint = CGPointMake(1422, 582);
    drawLine0274.width = 4;
    drawLine0274.color = [UIColor colorWithRed:(186/255.0) green:(146/255.0) blue:(131/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawLine0274];

    //

    MWDrawLine *drawLine0275 = [[MWDrawLine alloc] init];
    drawLine0275.startPoint = CGPointMake(1485.5, 694.5);
    drawLine0275.endPoint = CGPointMake(1437.5, 694);
    drawLine0275.width = 10;
    drawLine0275.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0275];

    MWDrawLine *drawLine0277 = [[MWDrawLine alloc] init];
    drawLine0277.startPoint = CGPointMake(1485.5, 694.5);
    drawLine0277.endPoint = CGPointMake(1510, 670);
    drawLine0277.width = 10;
    drawLine0277.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0277];

    MWDrawFillCircle *fillCircle0275 = [[MWDrawFillCircle alloc] init];
    fillCircle0275.center = CGPointMake(1485.5, 694.5);
    fillCircle0275.radius = 13;
    fillCircle0275.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0275];
    
    MWDrawFillCircle *fillCircle0276 = [[MWDrawFillCircle alloc] init];
    fillCircle0276.center = CGPointMake(1485.5, 694.5);
    fillCircle0276.radius = 10;
    fillCircle0276.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0276];

    MWDrawFillCircle *fillCircle0277 = [[MWDrawFillCircle alloc] init];
    fillCircle0277.center = CGPointMake(1437.5, 694);
    fillCircle0277.radius = 8.5;
    fillCircle0277.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0277];

    MWDrawFillCircle *fillCircle0278 = [[MWDrawFillCircle alloc] init];
    fillCircle0278.center = CGPointMake(1437.5, 694);
    fillCircle0278.radius = 6.5;
    fillCircle0278.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0278];

    MWDrawLine *drawLine0276 = [[MWDrawLine alloc] init];
    drawLine0276.startPoint = CGPointMake(1485.5, 694.5);
    drawLine0276.endPoint = CGPointMake(1437.5, 694);
    drawLine0276.width = 6;
    drawLine0276.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0276];

    MWDrawFillCircle *fillCircle0279 = [[MWDrawFillCircle alloc] init];
    fillCircle0279.center = CGPointMake(1510, 670);
    fillCircle0279.radius = 8.5;
    fillCircle0279.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0279];
    
    MWDrawFillCircle *fillCircle0280 = [[MWDrawFillCircle alloc] init];
    fillCircle0280.center = CGPointMake(1510, 670);
    fillCircle0280.radius = 6.5;
    fillCircle0280.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0280];

    MWDrawLine *drawLine0278 = [[MWDrawLine alloc] init];
    drawLine0278.startPoint = CGPointMake(1485.5, 694.5);
    drawLine0278.endPoint = CGPointMake(1510, 670);
    drawLine0278.width = 6;
    drawLine0278.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0278];

    MWDrawLine *drawLine0279 = [[MWDrawLine alloc] init];
    drawLine0279.startPoint = CGPointMake(1601.5, 809);
    drawLine0279.endPoint = CGPointMake(1564.5, 811);
    drawLine0279.width = 10;
    drawLine0279.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0279];

    MWDrawLine *drawLine0280 = [[MWDrawLine alloc] init];
    drawLine0280.startPoint = CGPointMake(1601.5, 809);
    drawLine0280.endPoint = CGPointMake(1583, 829);
    drawLine0280.width = 10;
    drawLine0280.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0280];

    MWDrawLine *drawLine0281 = [[MWDrawLine alloc] init];
    drawLine0281.startPoint = CGPointMake(1601.5, 809);
    drawLine0281.endPoint = CGPointMake(1602, 848);
    drawLine0281.width = 10;
    drawLine0281.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0281];

    MWDrawLine *drawLine0282 = [[MWDrawLine alloc] init];
    drawLine0282.startPoint = CGPointMake(1601.5, 809);
    drawLine0282.endPoint = CGPointMake(1625.5, 785.5);
    drawLine0282.width = 10;
    drawLine0282.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0282];

    MWDrawFillCircle *fillCircle0281 = [[MWDrawFillCircle alloc] init];
    fillCircle0281.center = CGPointMake(1601.5, 809);
    fillCircle0281.radius = 13;
    fillCircle0281.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0281];
    
    MWDrawFillCircle *fillCircle0282 = [[MWDrawFillCircle alloc] init];
    fillCircle0282.center = CGPointMake(1601.5, 809);
    fillCircle0282.radius = 10;
    fillCircle0282.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0282];

    MWDrawFillCircle *fillCircle0283 = [[MWDrawFillCircle alloc] init];
    fillCircle0283.center = CGPointMake(1564.5, 811);
    fillCircle0283.radius = 8.5;
    fillCircle0283.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0283];
    
    MWDrawFillCircle *fillCircle0284 = [[MWDrawFillCircle alloc] init];
    fillCircle0284.center = CGPointMake(1564.5, 811);
    fillCircle0284.radius = 6.5;
    fillCircle0284.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0284];

    MWDrawFillCircle *fillCircle0285 = [[MWDrawFillCircle alloc] init];
    fillCircle0285.center = CGPointMake(1583, 829);
    fillCircle0285.radius = 8.5;
    fillCircle0285.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0285];
    
    MWDrawFillCircle *fillCircle0286 = [[MWDrawFillCircle alloc] init];
    fillCircle0286.center = CGPointMake(1583, 829);
    fillCircle0286.radius = 6.5;
    fillCircle0286.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0286];

    MWDrawFillCircle *fillCircle0287 = [[MWDrawFillCircle alloc] init];
    fillCircle0287.center = CGPointMake(1602, 848);
    fillCircle0287.radius = 8.5;
    fillCircle0287.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0287];
    
    MWDrawFillCircle *fillCircle0288 = [[MWDrawFillCircle alloc] init];
    fillCircle0288.center = CGPointMake(1602, 848);
    fillCircle0288.radius = 6.5;
    fillCircle0288.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0288];

    MWDrawFillCircle *fillCircle0289 = [[MWDrawFillCircle alloc] init];
    fillCircle0289.center = CGPointMake(1625.5, 785.5);
    fillCircle0289.radius = 8.5;
    fillCircle0289.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0289];
    
    MWDrawFillCircle *fillCircle0290 = [[MWDrawFillCircle alloc] init];
    fillCircle0290.center = CGPointMake(1625.5, 785.5);
    fillCircle0290.radius = 6.5;
    fillCircle0290.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0290];

    MWDrawLine *drawLine0283 = [[MWDrawLine alloc] init];
    drawLine0283.startPoint = CGPointMake(1601.5, 809);
    drawLine0283.endPoint = CGPointMake(1564.5, 811);
    drawLine0283.width = 6;
    drawLine0283.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0283];
    
    MWDrawLine *drawLine0284 = [[MWDrawLine alloc] init];
    drawLine0284.startPoint = CGPointMake(1601.5, 809);
    drawLine0284.endPoint = CGPointMake(1583, 829);
    drawLine0284.width = 6;
    drawLine0284.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0284];
    
    MWDrawLine *drawLine0285 = [[MWDrawLine alloc] init];
    drawLine0285.startPoint = CGPointMake(1601.5, 809);
    drawLine0285.endPoint = CGPointMake(1602, 848);
    drawLine0285.width = 6;
    drawLine0285.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0285];
    
    MWDrawLine *drawLine0286 = [[MWDrawLine alloc] init];
    drawLine0286.startPoint = CGPointMake(1601.5, 809);
    drawLine0286.endPoint = CGPointMake(1625.5, 785.5);
    drawLine0286.width = 6;
    drawLine0286.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0286];

    //
    
    MWDrawLine *drawLine0287 = [[MWDrawLine alloc] init];
    drawLine0287.startPoint = CGPointMake(1717.5, 927);
    drawLine0287.endPoint = CGPointMake(1693.5, 951);
    drawLine0287.width = 10;
    drawLine0287.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0287];

    MWDrawFillCircle *fillCircle0291 = [[MWDrawFillCircle alloc] init];
    fillCircle0291.center = CGPointMake(1717.5, 927);
    fillCircle0291.radius = 13;
    fillCircle0291.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0291];
    
    MWDrawFillCircle *fillCircle0292 = [[MWDrawFillCircle alloc] init];
    fillCircle0292.center = CGPointMake(1717.5, 927);
    fillCircle0292.radius = 10;
    fillCircle0292.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0292];
    
    MWDrawFillCircle *fillCircle0293 = [[MWDrawFillCircle alloc] init];
    fillCircle0293.center = CGPointMake(1693.5, 951);
    fillCircle0293.radius = 8.5;
    fillCircle0293.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0293];
    
    MWDrawFillCircle *fillCircle0294 = [[MWDrawFillCircle alloc] init];
    fillCircle0294.center = CGPointMake(1693.5, 951);
    fillCircle0294.radius = 6.5;
    fillCircle0294.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0294];
    
    MWDrawLine *drawLine0288 = [[MWDrawLine alloc] init];
    drawLine0288.startPoint = CGPointMake(1717.5, 927);
    drawLine0288.endPoint = CGPointMake(1693.5, 951);
    drawLine0288.width = 6;
    drawLine0288.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0288];
    
    //
    
    MWDrawArc *drawArc0053 = [[MWDrawArc alloc] init];
    drawArc0053.center = CGPointMake(2088, 1320.5);
    drawArc0053.startRadians = 257 * M_PI / 180;
    drawArc0053.endRadians = 315 * M_PI / 180;
    drawArc0053.radius = 50;
    drawArc0053.width = 20;
    drawArc0053.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawArc0053];

    MWDrawArc *drawArc0054 = [[MWDrawArc alloc] init];
    drawArc0054.center = CGPointMake(2088, 1320.5);
    drawArc0054.startRadians = 250 * M_PI / 180;
    drawArc0054.endRadians = 315 * M_PI / 180;
    drawArc0054.radius = 50;
    drawArc0054.width = 10;
    drawArc0054.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawArc0054];

    MWDrawArc *drawArc0055 = [[MWDrawArc alloc] init];
    drawArc0055.center = CGPointMake(2158, 1390.5);
    drawArc0055.startRadians = 315 * M_PI / 180;
    drawArc0055.endRadians = 12 * M_PI / 180;
    drawArc0055.radius = 50;
    drawArc0055.width = 20;
    drawArc0055.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawArc0055];

    MWDrawArc *drawArc0056 = [[MWDrawArc alloc] init];
    drawArc0056.center = CGPointMake(2158, 1390.5);
    drawArc0056.startRadians = 315 * M_PI / 180;
    drawArc0056.endRadians = 27 * M_PI / 180;
    drawArc0056.radius = 50;
    drawArc0056.width = 10;
    drawArc0056.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawArc0056];

    MWDrawLine *drawLine0289 = [[MWDrawLine alloc] init];
    drawLine0289.startPoint = CGPointMake(2123, 1285);
    drawLine0289.endPoint = CGPointMake(2194, 1356);
    drawLine0289.width = 20;
    drawLine0289.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0289];

    MWDrawLine *drawLine0290 = [[MWDrawLine alloc] init];
    drawLine0290.startPoint = CGPointMake(2122, 1284);
    drawLine0290.endPoint = CGPointMake(2195, 1357);
    drawLine0290.width = 10;
    drawLine0290.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0290];

    //
    
    MWDrawLine *drawLine0291 = [[MWDrawLine alloc] init];
    drawLine0291.startPoint = CGPointMake(2338, 1559);
    drawLine0291.endPoint = CGPointMake(2338, 1601.5);
    drawLine0291.width = 10;
    drawLine0291.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0291];
    
    MWDrawFillCircle *fillCircle0295 = [[MWDrawFillCircle alloc] init];
    fillCircle0295.center = CGPointMake(2338, 1601.5);
    fillCircle0295.radius = 8.5;
    fillCircle0295.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0295];
    
    MWDrawFillCircle *fillCircle0296 = [[MWDrawFillCircle alloc] init];
    fillCircle0296.center = CGPointMake(2338, 1601.5);
    fillCircle0296.radius = 6.5;
    fillCircle0296.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0296];

    MWDrawLine *drawLine0292 = [[MWDrawLine alloc] init];
    drawLine0292.startPoint = CGPointMake(2338, 1549);
    drawLine0292.endPoint = CGPointMake(2338, 1601.5);
    drawLine0292.width = 6;
    drawLine0292.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0292];

    //

    MWDrawLine *drawLine0293 = [[MWDrawLine alloc] init];
    drawLine0293.startPoint = CGPointMake(2397, 2093);
    drawLine0293.endPoint = CGPointMake(2419.5, 2093);
    drawLine0293.width = 10;
    drawLine0293.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0293];

    MWDrawFillCircle *fillCircle0297 = [[MWDrawFillCircle alloc] init];
    fillCircle0297.center = CGPointMake(2397, 2093);
    fillCircle0297.radius = 8.5;
    fillCircle0297.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0297];
    
    MWDrawFillCircle *fillCircle0298 = [[MWDrawFillCircle alloc] init];
    fillCircle0298.center = CGPointMake(2397, 2093);
    fillCircle0298.radius = 6.5;
    fillCircle0298.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0298];

    MWDrawLine *drawLine0294 = [[MWDrawLine alloc] init];
    drawLine0294.startPoint = CGPointMake(2397, 2093);
    drawLine0294.endPoint = CGPointMake(2429.5, 2093);
    drawLine0294.width = 6;
    drawLine0294.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0294];

    //

    MWDrawLine *drawLine0295 = [[MWDrawLine alloc] init];
    drawLine0295.startPoint = CGPointMake(2805.5, 2683);
    drawLine0295.endPoint = CGPointMake(2829, 2658);
    drawLine0295.width = 10;
    drawLine0295.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0295];

    MWDrawFillCircle *fillCircle0299 = [[MWDrawFillCircle alloc] init];
    fillCircle0299.center = CGPointMake(2805.5, 2683);
    fillCircle0299.radius = 8.5;
    fillCircle0299.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0299];
    
    MWDrawFillCircle *fillCircle0300 = [[MWDrawFillCircle alloc] init];
    fillCircle0300.center = CGPointMake(2805.5, 2683);
    fillCircle0300.radius = 6.5;
    fillCircle0300.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0300];

    MWDrawFillCircle *fillCircle0301 = [[MWDrawFillCircle alloc] init];
    fillCircle0301.center = CGPointMake(2829, 2658);
    fillCircle0301.radius = 13;
    fillCircle0301.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0301];
    
    MWDrawFillCircle *fillCircle0302 = [[MWDrawFillCircle alloc] init];
    fillCircle0302.center = CGPointMake(2829, 2658);
    fillCircle0302.radius = 10;
    fillCircle0302.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0302];

    MWDrawLine *drawLine0296 = [[MWDrawLine alloc] init];
    drawLine0296.startPoint = CGPointMake(2805.5, 2683);
    drawLine0296.endPoint = CGPointMake(2829, 2658);
    drawLine0296.width = 6;
    drawLine0296.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0296];

    //
    
    MWDrawLine *drawLine0297 = [[MWDrawLine alloc] init];
    drawLine0297.startPoint = CGPointMake(2862, 2891.5);
    drawLine0297.endPoint = CGPointMake(2885, 2892);
    drawLine0297.width = 10;
    drawLine0297.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0297];
    
    MWDrawFillCircle *fillCircle0303 = [[MWDrawFillCircle alloc] init];
    fillCircle0303.center = CGPointMake(2862, 2891.5);
    fillCircle0303.radius = 8.5;
    fillCircle0303.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0303];
    
    MWDrawFillCircle *fillCircle0304 = [[MWDrawFillCircle alloc] init];
    fillCircle0304.center = CGPointMake(2862, 2891.5);
    fillCircle0304.radius = 6.5;
    fillCircle0304.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0304];

    MWDrawLine *drawLine0298 = [[MWDrawLine alloc] init];
    drawLine0298.startPoint = CGPointMake(2862, 2891.5);
    drawLine0298.endPoint = CGPointMake(2895, 2892);
    drawLine0298.width = 6;
    drawLine0298.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0298];

    //

    MWDrawLine *drawLine0299 = [[MWDrawLine alloc] init];
    drawLine0299.startPoint = CGPointMake(2274.5, 2599.5);
    drawLine0299.endPoint = CGPointMake(2291, 2599.5);
    drawLine0299.width = 10;
    drawLine0299.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0299];

    MWDrawFillCircle *fillCircle0305 = [[MWDrawFillCircle alloc] init];
    fillCircle0305.center = CGPointMake(2274.5, 2599.5);
    fillCircle0305.radius = 8.5;
    fillCircle0305.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0305];
    
    MWDrawFillCircle *fillCircle0306 = [[MWDrawFillCircle alloc] init];
    fillCircle0306.center = CGPointMake(2274.5, 2599.5);
    fillCircle0306.radius = 6.5;
    fillCircle0306.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0306];
    
    MWDrawLine *drawLine0300 = [[MWDrawLine alloc] init];
    drawLine0300.startPoint = CGPointMake(2274.5, 2599.5);
    drawLine0300.endPoint = CGPointMake(2301, 2599.5);
    drawLine0300.width = 6;
    drawLine0300.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0300];

    //

    MWDrawLine *drawLine0301 = [[MWDrawLine alloc] init];
    drawLine0301.startPoint = CGPointMake(1915, 2742);
    drawLine0301.endPoint = CGPointMake(1915, 2758.5);
    drawLine0301.width = 10;
    drawLine0301.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0301];

    MWDrawFillCircle *fillCircle0307 = [[MWDrawFillCircle alloc] init];
    fillCircle0307.center = CGPointMake(1915, 2742);
    fillCircle0307.radius = 8.5;
    fillCircle0307.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0307];
    
    MWDrawFillCircle *fillCircle0308 = [[MWDrawFillCircle alloc] init];
    fillCircle0308.center = CGPointMake(1915, 2742);
    fillCircle0308.radius = 6.5;
    fillCircle0308.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0308];

    MWDrawLine *drawLine0302 = [[MWDrawLine alloc] init];
    drawLine0302.startPoint = CGPointMake(1915, 2742);
    drawLine0302.endPoint = CGPointMake(1915, 2768.5);
    drawLine0302.width = 6;
    drawLine0302.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0302];

    //

    MWDrawLine *drawLine0303 = [[MWDrawLine alloc] init];
    drawLine0303.startPoint = CGPointMake(2304.5, 333.5);
    drawLine0303.endPoint = CGPointMake(2279.5, 333.5);
    drawLine0303.width = 10;
    drawLine0303.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0303];

    MWDrawFillCircle *fillCircle0309 = [[MWDrawFillCircle alloc] init];
    fillCircle0309.center = CGPointMake(2304.5, 333.5);
    fillCircle0309.radius = 8.5;
    fillCircle0309.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0309];
    
    MWDrawFillCircle *fillCircle0310 = [[MWDrawFillCircle alloc] init];
    fillCircle0310.center = CGPointMake(2304.5, 333.5);
    fillCircle0310.radius = 6.5;
    fillCircle0310.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0310];

    MWDrawFillCircle *fillCircle0311 = [[MWDrawFillCircle alloc] init];
    fillCircle0311.center = CGPointMake(2269.5, 333.5);
    fillCircle0311.radius = 13;
    fillCircle0311.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0311];
    
    MWDrawFillCircle *fillCircle0312 = [[MWDrawFillCircle alloc] init];
    fillCircle0312.center = CGPointMake(2269.5, 333.5);
    fillCircle0312.radius = 10;
    fillCircle0312.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0312];

    MWDrawLine *drawLine0304 = [[MWDrawLine alloc] init];
    drawLine0304.startPoint = CGPointMake(2304.5, 333.5);
    drawLine0304.endPoint = CGPointMake(2269.5, 333.5);
    drawLine0304.width = 6;
    drawLine0304.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0304];

    //

    MWDrawLine *drawLine0305 = [[MWDrawLine alloc] init];
    drawLine0305.startPoint = CGPointMake(2279.5, 906.5);
    drawLine0305.endPoint = CGPointMake(2317, 906.5);
    drawLine0305.width = 10;
    drawLine0305.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0305];

    MWDrawFillCircle *fillCircle0313 = [[MWDrawFillCircle alloc] init];
    fillCircle0313.center = CGPointMake(2317, 906.5);
    fillCircle0313.radius = 8.5;
    fillCircle0313.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0313];
    
    MWDrawFillCircle *fillCircle0314 = [[MWDrawFillCircle alloc] init];
    fillCircle0314.center = CGPointMake(2317, 906.5);
    fillCircle0314.radius = 6.5;
    fillCircle0314.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0314];

    MWDrawLine *drawLine0306 = [[MWDrawLine alloc] init];
    drawLine0306.startPoint = CGPointMake(2269.5, 906.5);
    drawLine0306.endPoint = CGPointMake(2317, 906.5);
    drawLine0306.width = 6;
    drawLine0306.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0306];

    //

    MWDrawLine *drawLine0307 = [[MWDrawLine alloc] init];
    drawLine0307.startPoint = CGPointMake(2280, 1071);
    drawLine0307.endPoint = CGPointMake(2313.5, 1071);
    drawLine0307.width = 10;
    drawLine0307.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0307];

    MWDrawFillCircle *fillCircle0315 = [[MWDrawFillCircle alloc] init];
    fillCircle0315.center = CGPointMake(2313.5, 1071);
    fillCircle0315.radius = 8.5;
    fillCircle0315.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0315];
    
    MWDrawFillCircle *fillCircle0316 = [[MWDrawFillCircle alloc] init];
    fillCircle0316.center = CGPointMake(2313.5, 1071);
    fillCircle0316.radius = 6.5;
    fillCircle0316.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0316];

    MWDrawLine *drawLine0308 = [[MWDrawLine alloc] init];
    drawLine0308.startPoint = CGPointMake(2270, 1071);
    drawLine0308.endPoint = CGPointMake(2313.5, 1071);
    drawLine0308.width = 6;
    drawLine0308.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0308];

    //
    
    MWDrawLine *drawLine0309 = [[MWDrawLine alloc] init];
    drawLine0309.startPoint = CGPointMake(1813.5, 1776);
    drawLine0309.endPoint = CGPointMake(1827, 1789);
    drawLine0309.width = 10;
    drawLine0309.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0309];

    MWDrawLine *drawLine0310 = [[MWDrawLine alloc] init];
    drawLine0310.startPoint = CGPointMake(1827, 1752);
    drawLine0310.endPoint = CGPointMake(1827, 1789);
    drawLine0310.width = 10;
    drawLine0310.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0310];

    MWDrawFillCircle *fillCircle0317 = [[MWDrawFillCircle alloc] init];
    fillCircle0317.center = CGPointMake(1808.5, 1771);
    fillCircle0317.radius = 8.5;
    fillCircle0317.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0317];
    
    MWDrawFillCircle *fillCircle0318 = [[MWDrawFillCircle alloc] init];
    fillCircle0318.center = CGPointMake(1808.5, 1771);
    fillCircle0318.radius = 6.5;
    fillCircle0318.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0318];

    MWDrawFillCircle *fillCircle0319 = [[MWDrawFillCircle alloc] init];
    fillCircle0319.center = CGPointMake(1827, 1745);
    fillCircle0319.radius = 8.5;
    fillCircle0319.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0319];
    
    MWDrawFillCircle *fillCircle0320 = [[MWDrawFillCircle alloc] init];
    fillCircle0320.center = CGPointMake(1827, 1745);
    fillCircle0320.radius = 6.5;
    fillCircle0320.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0320];

    MWDrawFillCircle *fillCircle0321 = [[MWDrawFillCircle alloc] init];
    fillCircle0321.center = CGPointMake(1827, 1789);
    fillCircle0321.radius = 13;
    fillCircle0321.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0321];
    
    MWDrawFillCircle *fillCircle0322 = [[MWDrawFillCircle alloc] init];
    fillCircle0322.center = CGPointMake(1827, 1789);
    fillCircle0322.radius = 10;
    fillCircle0322.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0322];

    MWDrawLine *drawLine0311 = [[MWDrawLine alloc] init];
    drawLine0311.startPoint = CGPointMake(1808.5, 1771);
    drawLine0311.endPoint = CGPointMake(1827, 1789);
    drawLine0311.width = 6;
    drawLine0311.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0311];

    MWDrawLine *drawLine0312 = [[MWDrawLine alloc] init];
    drawLine0312.startPoint = CGPointMake(1827, 1745);
    drawLine0312.endPoint = CGPointMake(1827, 1789);
    drawLine0312.width = 6;
    drawLine0312.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0312];

    //
    
    MWDrawLine *drawLine0313 = [[MWDrawLine alloc] init];
    drawLine0313.startPoint = CGPointMake(1730.5, 1849);
    drawLine0313.endPoint = CGPointMake(1767, 1885.5);
    drawLine0313.width = 10;
    drawLine0313.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0313];

    MWDrawFillCircle *fillCircle0323 = [[MWDrawFillCircle alloc] init];
    fillCircle0323.center = CGPointMake(1748.5, 1867);
    fillCircle0323.radius = 13;
    fillCircle0323.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0323];
    
    MWDrawFillCircle *fillCircle0324 = [[MWDrawFillCircle alloc] init];
    fillCircle0324.center = CGPointMake(1748.5, 1867);
    fillCircle0324.radius = 10;
    fillCircle0324.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0324];

    MWDrawFillCircle *fillCircle0325 = [[MWDrawFillCircle alloc] init];
    fillCircle0325.center = CGPointMake(1730.5, 1849);
    fillCircle0325.radius = 8.5;
    fillCircle0325.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0325];
    
    MWDrawFillCircle *fillCircle0326 = [[MWDrawFillCircle alloc] init];
    fillCircle0326.center = CGPointMake(1730.5, 1849);
    fillCircle0326.radius = 6.5;
    fillCircle0326.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0326];

    MWDrawFillCircle *fillCircle0327 = [[MWDrawFillCircle alloc] init];
    fillCircle0327.center = CGPointMake(1767, 1885.5);
    fillCircle0327.radius = 8.5;
    fillCircle0327.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0327];
    
    MWDrawFillCircle *fillCircle0328 = [[MWDrawFillCircle alloc] init];
    fillCircle0328.center = CGPointMake(1767, 1885.5);
    fillCircle0328.radius = 6.5;
    fillCircle0328.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0328];

    MWDrawLine *drawLine0314 = [[MWDrawLine alloc] init];
    drawLine0314.startPoint = CGPointMake(1730.5, 1849);
    drawLine0314.endPoint = CGPointMake(1767, 1885.5);
    drawLine0314.width = 6;
    drawLine0314.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0314];

    //
    
    MWDrawLine *drawLine0315 = [[MWDrawLine alloc] init];
    drawLine0315.startPoint = CGPointMake(1640, 1926.5);
    drawLine0315.endPoint = CGPointMake(1689, 1974.5);
    drawLine0315.width = 10;
    drawLine0315.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0315];

    MWDrawFillCircle *fillCircle0329 = [[MWDrawFillCircle alloc] init];
    fillCircle0329.center = CGPointMake(1665, 1951);
    fillCircle0329.radius = 13;
    fillCircle0329.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0329];
    
    MWDrawFillCircle *fillCircle0330 = [[MWDrawFillCircle alloc] init];
    fillCircle0330.center = CGPointMake(1665, 1951);
    fillCircle0330.radius = 10;
    fillCircle0330.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0330];

    MWDrawFillCircle *fillCircle0331 = [[MWDrawFillCircle alloc] init];
    fillCircle0331.center = CGPointMake(1640, 1926.5);
    fillCircle0331.radius = 8.5;
    fillCircle0331.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0331];
    
    MWDrawFillCircle *fillCircle0332 = [[MWDrawFillCircle alloc] init];
    fillCircle0332.center = CGPointMake(1640, 1926.5);
    fillCircle0332.radius = 6.5;
    fillCircle0332.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0332];

    MWDrawFillCircle *fillCircle0333 = [[MWDrawFillCircle alloc] init];
    fillCircle0333.center = CGPointMake(1689, 1974.5);
    fillCircle0333.radius = 8.5;
    fillCircle0333.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0333];
    
    MWDrawFillCircle *fillCircle0334 = [[MWDrawFillCircle alloc] init];
    fillCircle0334.center = CGPointMake(1689, 1974.5);
    fillCircle0334.radius = 6.5;
    fillCircle0334.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0334];

    MWDrawLine *drawLine0316 = [[MWDrawLine alloc] init];
    drawLine0316.startPoint = CGPointMake(1640, 1926.5);
    drawLine0316.endPoint = CGPointMake(1689, 1974.5);
    drawLine0316.width = 6;
    drawLine0316.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0316];

    //
    
    MWDrawLine *drawLine0317 = [[MWDrawLine alloc] init];
    drawLine0317.startPoint = CGPointMake(1563.5, 2016);
    drawLine0317.endPoint = CGPointMake(1606.5, 2059);
    drawLine0317.width = 10;
    drawLine0317.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0317];

    MWDrawFillCircle *fillCircle0335 = [[MWDrawFillCircle alloc] init];
    fillCircle0335.center = CGPointMake(1582, 2034);
    fillCircle0335.radius = 13;
    fillCircle0335.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0335];
    
    MWDrawFillCircle *fillCircle0336 = [[MWDrawFillCircle alloc] init];
    fillCircle0336.center = CGPointMake(1582, 2034);
    fillCircle0336.radius = 10;
    fillCircle0336.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0336];

    MWDrawFillCircle *fillCircle0337 = [[MWDrawFillCircle alloc] init];
    fillCircle0337.center = CGPointMake(1563.5, 2016);
    fillCircle0337.radius = 8.5;
    fillCircle0337.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0337];
    
    MWDrawFillCircle *fillCircle0338 = [[MWDrawFillCircle alloc] init];
    fillCircle0338.center = CGPointMake(1563.5, 2016);
    fillCircle0338.radius = 6.5;
    fillCircle0338.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0338];

    MWDrawFillCircle *fillCircle0339 = [[MWDrawFillCircle alloc] init];
    fillCircle0339.center = CGPointMake(1606.5, 2059);
    fillCircle0339.radius = 8.5;
    fillCircle0339.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0339];
    
    MWDrawFillCircle *fillCircle0340 = [[MWDrawFillCircle alloc] init];
    fillCircle0340.center = CGPointMake(1606.5, 2059);
    fillCircle0340.radius = 6.5;
    fillCircle0340.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0340];
    
    MWDrawLine *drawLine0318 = [[MWDrawLine alloc] init];
    drawLine0318.startPoint = CGPointMake(1563.5, 2016);
    drawLine0318.endPoint = CGPointMake(1606.5, 2059);
    drawLine0318.width = 6;
    drawLine0318.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0318];

    //
    
    MWDrawLine *drawLine0319 = [[MWDrawLine alloc] init];
    drawLine0319.startPoint = CGPointMake(1477.5, 2138.5);
    drawLine0319.endPoint = CGPointMake(1501.5, 2162);
    drawLine0319.width = 10;
    drawLine0319.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0319];

    MWDrawFillCircle *fillCircle0341 = [[MWDrawFillCircle alloc] init];
    fillCircle0341.center = CGPointMake(1477.5, 2138.5);
    fillCircle0341.radius = 13;
    fillCircle0341.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0341];
    
    MWDrawFillCircle *fillCircle0342 = [[MWDrawFillCircle alloc] init];
    fillCircle0342.center = CGPointMake(1477.5, 2138.5);
    fillCircle0342.radius = 10;
    fillCircle0342.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0342];

    MWDrawFillCircle *fillCircle0343 = [[MWDrawFillCircle alloc] init];
    fillCircle0343.center = CGPointMake(1501.5, 2162);
    fillCircle0343.radius = 8.5;
    fillCircle0343.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0343];
    
    MWDrawFillCircle *fillCircle0344 = [[MWDrawFillCircle alloc] init];
    fillCircle0344.center = CGPointMake(1501.5, 2162);
    fillCircle0344.radius = 6.5;
    fillCircle0344.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0344];

    MWDrawLine *drawLine0320 = [[MWDrawLine alloc] init];
    drawLine0320.startPoint = CGPointMake(1477.5, 2138.5);
    drawLine0320.endPoint = CGPointMake(1501.5, 2162);
    drawLine0320.width = 6;
    drawLine0320.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0320];

    //
    
    MWDrawLine *drawLine0321 = [[MWDrawLine alloc] init];
    drawLine0321.startPoint = CGPointMake(1138, 2428);
    drawLine0321.endPoint = CGPointMake(1163, 2453.5);
    drawLine0321.width = 10;
    drawLine0321.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0321];

    MWDrawLine *drawLine0323 = [[MWDrawLine alloc] init];
    drawLine0323.startPoint = CGPointMake(1163, 2417.5);
    drawLine0323.endPoint = CGPointMake(1163, 2477);
    drawLine0323.width = 10;
    drawLine0323.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0323];

    MWDrawFillCircle *fillCircle0245 = [[MWDrawFillCircle alloc] init];
    fillCircle0245.center = CGPointMake(1163, 2453.5);
    fillCircle0245.radius = 13;
    fillCircle0245.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0245];
    
    MWDrawFillCircle *fillCircle0345 = [[MWDrawFillCircle alloc] init];
    fillCircle0345.center = CGPointMake(1163, 2453.5);
    fillCircle0345.radius = 10;
    fillCircle0345.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0345];

    MWDrawFillCircle *fillCircle0346 = [[MWDrawFillCircle alloc] init];
    fillCircle0346.center = CGPointMake(1138, 2428);
    fillCircle0346.radius = 8.5;
    fillCircle0346.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0346];
    
    MWDrawFillCircle *fillCircle0347 = [[MWDrawFillCircle alloc] init];
    fillCircle0347.center = CGPointMake(1138, 2428);
    fillCircle0347.radius = 6.5;
    fillCircle0347.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0347];

    MWDrawFillCircle *fillCircle0348 = [[MWDrawFillCircle alloc] init];
    fillCircle0348.center = CGPointMake(1163, 2417.5);
    fillCircle0348.radius = 8.5;
    fillCircle0348.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0348];
    
    MWDrawFillCircle *fillCircle0349 = [[MWDrawFillCircle alloc] init];
    fillCircle0349.center = CGPointMake(1163, 2417.5);
    fillCircle0349.radius = 6.5;
    fillCircle0349.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0349];

    MWDrawFillCircle *fillCircle0350 = [[MWDrawFillCircle alloc] init];
    fillCircle0350.center = CGPointMake(1163, 2477);
    fillCircle0350.radius = 8.5;
    fillCircle0350.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0350];
    
    MWDrawFillCircle *fillCircle0351 = [[MWDrawFillCircle alloc] init];
    fillCircle0351.center = CGPointMake(1163, 2477);
    fillCircle0351.radius = 6.5;
    fillCircle0351.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0351];

    MWDrawLine *drawLine0322 = [[MWDrawLine alloc] init];
    drawLine0322.startPoint = CGPointMake(1138, 2428);
    drawLine0322.endPoint = CGPointMake(1163, 2453.5);
    drawLine0322.width = 6;
    drawLine0322.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0322];

    MWDrawLine *drawLine0324 = [[MWDrawLine alloc] init];
    drawLine0324.startPoint = CGPointMake(1163, 2417.5);
    drawLine0324.endPoint = CGPointMake(1163, 2477);
    drawLine0324.width = 6;
    drawLine0324.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0324];

    //

    MWDrawLine *drawLine0325 = [[MWDrawLine alloc] init];
    drawLine0325.startPoint = CGPointMake(3130.5, 370);
    drawLine0325.endPoint = CGPointMake(3165.5, 370);
    drawLine0325.width = 10;
    drawLine0325.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0325];

    MWDrawFillCircle *fillCircle0352 = [[MWDrawFillCircle alloc] init];
    fillCircle0352.center = CGPointMake(3130.5, 370);
    fillCircle0352.radius = 8.5;
    fillCircle0352.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0352];
    
    MWDrawFillCircle *fillCircle0353 = [[MWDrawFillCircle alloc] init];
    fillCircle0353.center = CGPointMake(3130.5, 370);
    fillCircle0353.radius = 6.5;
    fillCircle0353.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0353];

    MWDrawLine *drawLine0326 = [[MWDrawLine alloc] init];
    drawLine0326.startPoint = CGPointMake(3130.5, 370);
    drawLine0326.endPoint = CGPointMake(3175.5, 370);
    drawLine0326.width = 6;
    drawLine0326.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0326];

    //
    
    MWDrawLine *drawLine0327 = [[MWDrawLine alloc] init];
    drawLine0327.startPoint = CGPointMake(3071.5, 474);
    drawLine0327.endPoint = CGPointMake(3026.5, 474);
    drawLine0327.width = 10;
    drawLine0327.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0327];

    MWDrawFillCircle *fillCircle0354 = [[MWDrawFillCircle alloc] init];
    fillCircle0354.center = CGPointMake(3071.5, 474);
    fillCircle0354.radius = 13;
    fillCircle0354.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0354];
    
    MWDrawFillCircle *fillCircle0355 = [[MWDrawFillCircle alloc] init];
    fillCircle0355.center = CGPointMake(3071.5, 474);
    fillCircle0355.radius = 10;
    fillCircle0355.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0355];
    
    MWDrawFillCircle *fillCircle0356 = [[MWDrawFillCircle alloc] init];
    fillCircle0356.center = CGPointMake(3026.5, 474);
    fillCircle0356.radius = 8.5;
    fillCircle0356.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0356];
    
    MWDrawFillCircle *fillCircle0357 = [[MWDrawFillCircle alloc] init];
    fillCircle0357.center = CGPointMake(3026.5, 474);
    fillCircle0357.radius = 6.5;
    fillCircle0357.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0357];

    MWDrawLine *drawLine0328 = [[MWDrawLine alloc] init];
    drawLine0328.startPoint = CGPointMake(3071.5, 474);
    drawLine0328.endPoint = CGPointMake(3026.5, 474);
    drawLine0328.width = 6;
    drawLine0328.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0328];

    //
    
    MWDrawLine *drawLine0329 = [[MWDrawLine alloc] init];
    drawLine0329.startPoint = CGPointMake(2653.5, 891.5);
    drawLine0329.endPoint = CGPointMake(2672, 910);
    drawLine0329.width = 10;
    drawLine0329.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0329];

    MWDrawFillCircle *fillCircle0358 = [[MWDrawFillCircle alloc] init];
    fillCircle0358.center = CGPointMake(2653.5, 891.5);
    fillCircle0358.radius = 13;
    fillCircle0358.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0358];
    
    MWDrawFillCircle *fillCircle0359 = [[MWDrawFillCircle alloc] init];
    fillCircle0359.center = CGPointMake(2653.5, 891.5);
    fillCircle0359.radius = 10;
    fillCircle0359.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0359];
    
    MWDrawFillCircle *fillCircle0360 = [[MWDrawFillCircle alloc] init];
    fillCircle0360.center = CGPointMake(2672, 910);
    fillCircle0360.radius = 8.5;
    fillCircle0360.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0360];
    
    MWDrawFillCircle *fillCircle0361 = [[MWDrawFillCircle alloc] init];
    fillCircle0361.center = CGPointMake(2672, 910);
    fillCircle0361.radius = 6.5;
    fillCircle0361.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0361];

    MWDrawLine *drawLine0330 = [[MWDrawLine alloc] init];
    drawLine0330.startPoint = CGPointMake(2653.5, 891.5);
    drawLine0330.endPoint = CGPointMake(2672, 910);
    drawLine0330.width = 6;
    drawLine0330.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0330];

    //

    MWDrawLine *drawLine0331 = [[MWDrawLine alloc] init];
    drawLine0331.startPoint = CGPointMake(2585, 925);
    drawLine0331.endPoint = CGPointMake(2585, 961);
    drawLine0331.width = 10;
    drawLine0331.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0331];
    
    MWDrawFillCircle *fillCircle0362 = [[MWDrawFillCircle alloc] init];
    fillCircle0362.center = CGPointMake(2585, 961);
    fillCircle0362.radius = 13;
    fillCircle0362.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0362];
    
    MWDrawFillCircle *fillCircle0363 = [[MWDrawFillCircle alloc] init];
    fillCircle0363.center = CGPointMake(2585, 961);
    fillCircle0363.radius = 10;
    fillCircle0363.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0363];
    
    MWDrawFillCircle *fillCircle0364 = [[MWDrawFillCircle alloc] init];
    fillCircle0364.center = CGPointMake(2585, 925);
    fillCircle0364.radius = 8.5;
    fillCircle0364.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0364];
    
    MWDrawFillCircle *fillCircle0365 = [[MWDrawFillCircle alloc] init];
    fillCircle0365.center = CGPointMake(2585, 925);
    fillCircle0365.radius = 6.5;
    fillCircle0365.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0365];
    
    MWDrawLine *drawLine0332 = [[MWDrawLine alloc] init];
    drawLine0332.startPoint = CGPointMake(2585, 925);
    drawLine0332.endPoint = CGPointMake(2585, 961);
    drawLine0332.width = 6;
    drawLine0332.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0332];

    //
    
    MWDrawArc *drawArc0057 = [[MWDrawArc alloc] init];
    drawArc0057.center = CGPointMake(2461, 1017);
    drawArc0057.startRadians = 343.5 * M_PI / 180;
    drawArc0057.endRadians = 350 * M_PI / 180;
    drawArc0057.radius = 80;
    drawArc0057.width = 3;
    drawArc0057.color = [UIColor colorWithRed:(216/255.0) green:(240/255.0) blue:(252/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0057];
    
    MWDrawArc *drawArc0058 = [[MWDrawArc alloc] init];
    drawArc0058.center = CGPointMake(2463, 1026);
    drawArc0058.startRadians = 348.5 * M_PI / 180;
    drawArc0058.endRadians = 355 * M_PI / 180;
    drawArc0058.radius = 80;
    drawArc0058.width = 3;
    drawArc0058.color = [UIColor colorWithRed:(216/255.0) green:(240/255.0) blue:(252/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0058];

    MWDrawArc *drawArc0059 = [[MWDrawArc alloc] init];
    drawArc0059.center = CGPointMake(2442, 1127);
    drawArc0059.startRadians = 291 * M_PI / 180;
    drawArc0059.endRadians = 297 * M_PI / 180;
    drawArc0059.radius = 80;
    drawArc0059.width = 3;
    drawArc0059.color = [UIColor colorWithRed:(216/255.0) green:(240/255.0) blue:(252/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0059];

    MWDrawArc *drawArc0060 = [[MWDrawArc alloc] init];
    drawArc0060.center = CGPointMake(2442, 1127);
    drawArc0060.startRadians = 302 * M_PI / 180;
    drawArc0060.endRadians = 308 * M_PI / 180;
    drawArc0060.radius = 80;
    drawArc0060.width = 3;
    drawArc0060.color = [UIColor colorWithRed:(216/255.0) green:(240/255.0) blue:(252/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0060];

    MWDrawArc *drawArc0061 = [[MWDrawArc alloc] init];
    drawArc0061.center = CGPointMake(2442, 1127);
    drawArc0061.startRadians = 312 * M_PI / 180;
    drawArc0061.endRadians = 315 * M_PI / 180;
    drawArc0061.radius = 80;
    drawArc0061.width = 3;
    drawArc0061.color = [UIColor colorWithRed:(216/255.0) green:(240/255.0) blue:(252/255.0) alpha:1];
    [self.additionalOverMapPrimitives addObject:drawArc0061];

    //
    
    MWDrawLine *drawLine0333 = [[MWDrawLine alloc] init];
    drawLine0333.startPoint = CGPointMake(2907, 1078.5);
    drawLine0333.endPoint = CGPointMake(2888, 1097.5);
    drawLine0333.width = 10;
    drawLine0333.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0333];
    
    MWDrawFillCircle *fillCircle0366 = [[MWDrawFillCircle alloc] init];
    fillCircle0366.center = CGPointMake(2907, 1078.5);
    fillCircle0366.radius = 13;
    fillCircle0366.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0366];
    
    MWDrawFillCircle *fillCircle0367 = [[MWDrawFillCircle alloc] init];
    fillCircle0367.center = CGPointMake(2907, 1078.5);
    fillCircle0367.radius = 10;
    fillCircle0367.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0367];
    
    MWDrawFillCircle *fillCircle0368 = [[MWDrawFillCircle alloc] init];
    fillCircle0368.center = CGPointMake(2888, 1097.5);
    fillCircle0368.radius = 8.5;
    fillCircle0368.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0368];
    
    MWDrawFillCircle *fillCircle0369 = [[MWDrawFillCircle alloc] init];
    fillCircle0369.center = CGPointMake(2888, 1097.5);
    fillCircle0369.radius = 6.5;
    fillCircle0369.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0369];
    
    MWDrawLine *drawLine0334 = [[MWDrawLine alloc] init];
    drawLine0334.startPoint = CGPointMake(2907, 1078.5);
    drawLine0334.endPoint = CGPointMake(2888, 1097.5);
    drawLine0334.width = 6;
    drawLine0334.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0334];

    //
    
    MWDrawLine *drawLine0335 = [[MWDrawLine alloc] init];
    drawLine0335.startPoint = CGPointMake(2950, 1122);
    drawLine0335.endPoint = CGPointMake(2931, 1140.5);
    drawLine0335.width = 10;
    drawLine0335.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0335];

    MWDrawFillCircle *fillCircle0370 = [[MWDrawFillCircle alloc] init];
    fillCircle0370.center = CGPointMake(2950, 1122);
    fillCircle0370.radius = 13;
    fillCircle0370.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0370];
    
    MWDrawFillCircle *fillCircle0371 = [[MWDrawFillCircle alloc] init];
    fillCircle0371.center = CGPointMake(2950, 1122);
    fillCircle0371.radius = 10;
    fillCircle0371.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0371];
    
    MWDrawFillCircle *fillCircle0372 = [[MWDrawFillCircle alloc] init];
    fillCircle0372.center = CGPointMake(2931, 1140.5);
    fillCircle0372.radius = 8.5;
    fillCircle0372.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0372];
    
    MWDrawFillCircle *fillCircle0373 = [[MWDrawFillCircle alloc] init];
    fillCircle0373.center = CGPointMake(2931, 1140.5);
    fillCircle0373.radius = 6.5;
    fillCircle0373.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0373];

    MWDrawLine *drawLine0336 = [[MWDrawLine alloc] init];
    drawLine0336.startPoint = CGPointMake(2950, 1122);
    drawLine0336.endPoint = CGPointMake(2931, 1140.5);
    drawLine0336.width = 6;
    drawLine0336.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0336];

    //
    
    MWDrawLine *drawLine0337 = [[MWDrawLine alloc] init];
    drawLine0337.startPoint = CGPointMake(2977.5, 1197.5);
    drawLine0337.endPoint = CGPointMake(2956, 1175);
    drawLine0337.width = 10;
    drawLine0337.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0337];
    
    MWDrawFillCircle *fillCircle0374 = [[MWDrawFillCircle alloc] init];
    fillCircle0374.center = CGPointMake(2977.5, 1197.5);
    fillCircle0374.radius = 13;
    fillCircle0374.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0374];

    MWDrawFillCircle *fillCircle0375 = [[MWDrawFillCircle alloc] init];
    fillCircle0375.center = CGPointMake(2977.5, 1197.5);
    fillCircle0375.radius = 10;
    fillCircle0375.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0375];

    MWDrawFillCircle *fillCircle0376 = [[MWDrawFillCircle alloc] init];
    fillCircle0376.center = CGPointMake(2956, 1175);
    fillCircle0376.radius = 8.5;
    fillCircle0376.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0376];
    
    MWDrawFillCircle *fillCircle0377 = [[MWDrawFillCircle alloc] init];
    fillCircle0377.center = CGPointMake(2956, 1175);
    fillCircle0377.radius = 6.5;
    fillCircle0377.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0377];

    MWDrawLine *drawLine0338 = [[MWDrawLine alloc] init];
    drawLine0338.startPoint = CGPointMake(2977.5, 1197.5);
    drawLine0338.endPoint = CGPointMake(2956, 1175);
    drawLine0338.width = 6;
    drawLine0338.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0338];

    //
    
    MWDrawLine *drawLine0339 = [[MWDrawLine alloc] init];
    drawLine0339.startPoint = CGPointMake(2936.5, 1223);
    drawLine0339.endPoint = CGPointMake(2936.5, 1192);
    drawLine0339.width = 10;
    drawLine0339.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0339];

    MWDrawFillCircle *fillCircle0378 = [[MWDrawFillCircle alloc] init];
    fillCircle0378.center = CGPointMake(2936.5, 1223);
    fillCircle0378.radius = 13;
    fillCircle0378.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0378];
    
    MWDrawFillCircle *fillCircle0379 = [[MWDrawFillCircle alloc] init];
    fillCircle0379.center = CGPointMake(2936.5, 1223);
    fillCircle0379.radius = 10;
    fillCircle0379.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0379];

    MWDrawFillCircle *fillCircle0380 = [[MWDrawFillCircle alloc] init];
    fillCircle0380.center = CGPointMake(2936.5, 1192);
    fillCircle0380.radius = 8.5;
    fillCircle0380.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0380];
    
    MWDrawFillCircle *fillCircle0381 = [[MWDrawFillCircle alloc] init];
    fillCircle0381.center = CGPointMake(2936.5, 1192);
    fillCircle0381.radius = 6.5;
    fillCircle0381.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0381];

    MWDrawLine *drawLine0340 = [[MWDrawLine alloc] init];
    drawLine0340.startPoint = CGPointMake(2936.5, 1223);
    drawLine0340.endPoint = CGPointMake(2936.5, 1192);
    drawLine0340.width = 6;
    drawLine0340.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0340];

    //
    
    MWDrawLine *drawLine0341 = [[MWDrawLine alloc] init];
    drawLine0341.startPoint = CGPointMake(2861.5, 1164);
    drawLine0341.endPoint = CGPointMake(2879.5, 1146.5);
    drawLine0341.width = 10;
    drawLine0341.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0341];

    MWDrawFillCircle *fillCircle0382 = [[MWDrawFillCircle alloc] init];
    fillCircle0382.center = CGPointMake(2861.5, 1164);
    fillCircle0382.radius = 13;
    fillCircle0382.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0382];
    
    MWDrawFillCircle *fillCircle0383 = [[MWDrawFillCircle alloc] init];
    fillCircle0383.center = CGPointMake(2861.5, 1164);
    fillCircle0383.radius = 10;
    fillCircle0383.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0383];

    MWDrawFillCircle *fillCircle0384 = [[MWDrawFillCircle alloc] init];
    fillCircle0384.center = CGPointMake(2879.5, 1146.5);
    fillCircle0384.radius = 8.5;
    fillCircle0384.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0384];
    
    MWDrawFillCircle *fillCircle0385 = [[MWDrawFillCircle alloc] init];
    fillCircle0385.center = CGPointMake(2879.5, 1146.5);
    fillCircle0385.radius = 6.5;
    fillCircle0385.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0385];

    MWDrawLine *drawLine0342 = [[MWDrawLine alloc] init];
    drawLine0342.startPoint = CGPointMake(2861.5, 1164);
    drawLine0342.endPoint = CGPointMake(2879.5, 1146.5);
    drawLine0342.width = 6;
    drawLine0342.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0342];

    //

    MWDrawLine *drawLine0343 = [[MWDrawLine alloc] init];
    drawLine0343.startPoint = CGPointMake(1889, 2008);
    drawLine0343.endPoint = CGPointMake(1940.5, 2058.5);
    drawLine0343.width = 10;
    drawLine0343.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0343];

    MWDrawFillCircle *fillCircle0386 = [[MWDrawFillCircle alloc] init];
    fillCircle0386.center = CGPointMake(1889, 2008);
    fillCircle0386.radius = 8.5;
    fillCircle0386.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0386];
    
    MWDrawFillCircle *fillCircle0387 = [[MWDrawFillCircle alloc] init];
    fillCircle0387.center = CGPointMake(1889, 2008);
    fillCircle0387.radius = 6.5;
    fillCircle0387.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0387];

    MWDrawFillCircle *fillCircle0388 = [[MWDrawFillCircle alloc] init];
    fillCircle0388.center = CGPointMake(1915.5, 2033);
    fillCircle0388.radius = 13;
    fillCircle0388.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0388];
    
    MWDrawFillCircle *fillCircle0389 = [[MWDrawFillCircle alloc] init];
    fillCircle0389.center = CGPointMake(1915.5, 2033);
    fillCircle0389.radius = 10;
    fillCircle0389.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0389];

    MWDrawFillCircle *fillCircle0390 = [[MWDrawFillCircle alloc] init];
    fillCircle0390.center = CGPointMake(1940.5, 2058.5);
    fillCircle0390.radius = 8.5;
    fillCircle0390.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0390];
    
    MWDrawFillCircle *fillCircle0391 = [[MWDrawFillCircle alloc] init];
    fillCircle0391.center = CGPointMake(1940.5, 2058.5);
    fillCircle0391.radius = 6.5;
    fillCircle0391.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0391];

    MWDrawLine *drawLine0344 = [[MWDrawLine alloc] init];
    drawLine0344.startPoint = CGPointMake(1889, 2008);
    drawLine0344.endPoint = CGPointMake(1940.5, 2058.5);
    drawLine0344.width = 6;
    drawLine0344.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0344];

    //
    
    MWDrawLine *drawLine0345 = [[MWDrawLine alloc] init];
    drawLine0345.startPoint = CGPointMake(1923, 2207);
    drawLine0345.endPoint = CGPointMake(1931.5, 2216);
    drawLine0345.width = 10;
    drawLine0345.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0345];

    MWDrawLine *drawLine0346 = [[MWDrawLine alloc] init];
    drawLine0346.startPoint = CGPointMake(1915, 2210);
    drawLine0346.endPoint = CGPointMake(1915, 2224);
    drawLine0346.width = 10;
    drawLine0346.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0346];

    MWDrawLine *drawLine0347 = [[MWDrawLine alloc] init];
    drawLine0347.startPoint = CGPointMake(1905, 2199);
    drawLine0347.endPoint = CGPointMake(1890, 2199);
    drawLine0347.width = 10;
    drawLine0347.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0347];

    MWDrawLine *drawLine0348 = [[MWDrawLine alloc] init];
    drawLine0348.startPoint = CGPointMake(1907, 2191);
    drawLine0348.endPoint = CGPointMake(1890, 2174.5);
    drawLine0348.width = 10;
    drawLine0348.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0348];

    MWDrawFillCircle *fillCircle0392 = [[MWDrawFillCircle alloc] init];
    fillCircle0392.center = CGPointMake(1931.5, 2216);
    fillCircle0392.radius = 8.5;
    fillCircle0392.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0392];
    
    MWDrawFillCircle *fillCircle0393 = [[MWDrawFillCircle alloc] init];
    fillCircle0393.center = CGPointMake(1931.5, 2216);
    fillCircle0393.radius = 6.5;
    fillCircle0393.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0393];

    MWDrawFillCircle *fillCircle0394 = [[MWDrawFillCircle alloc] init];
    fillCircle0394.center = CGPointMake(1915, 2224);
    fillCircle0394.radius = 8.5;
    fillCircle0394.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0394];
    
    MWDrawFillCircle *fillCircle0395 = [[MWDrawFillCircle alloc] init];
    fillCircle0395.center = CGPointMake(1915, 2224);
    fillCircle0395.radius = 6.5;
    fillCircle0395.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0395];

    MWDrawFillCircle *fillCircle0396 = [[MWDrawFillCircle alloc] init];
    fillCircle0396.center = CGPointMake(1890, 2199);
    fillCircle0396.radius = 8.5;
    fillCircle0396.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0396];
    
    MWDrawFillCircle *fillCircle0397 = [[MWDrawFillCircle alloc] init];
    fillCircle0397.center = CGPointMake(1890, 2199);
    fillCircle0397.radius = 6.5;
    fillCircle0397.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0397];

    MWDrawFillCircle *fillCircle0398 = [[MWDrawFillCircle alloc] init];
    fillCircle0398.center = CGPointMake(1890, 2174.5);
    fillCircle0398.radius = 8.5;
    fillCircle0398.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0398];
    
    MWDrawFillCircle *fillCircle0399 = [[MWDrawFillCircle alloc] init];
    fillCircle0399.center = CGPointMake(1890, 2174.5);
    fillCircle0399.radius = 6.5;
    fillCircle0399.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0399];

    MWDrawLine *drawLine0349 = [[MWDrawLine alloc] init];
    drawLine0349.startPoint = CGPointMake(1931.5, 2216);
    drawLine0349.endPoint = CGPointMake(1890, 2174.5);
    drawLine0349.width = 6;
    drawLine0349.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0349];

    MWDrawLine *drawLine0350 = [[MWDrawLine alloc] init];
    drawLine0350.startPoint = CGPointMake(1915, 2199);
    drawLine0350.endPoint = CGPointMake(1915, 2224);
    drawLine0350.width = 6;
    drawLine0350.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0350];

    MWDrawLine *drawLine0351 = [[MWDrawLine alloc] init];
    drawLine0351.startPoint = CGPointMake(1915, 2199);
    drawLine0351.endPoint = CGPointMake(1890, 2199);
    drawLine0351.width = 6;
    drawLine0351.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0351];

    //
    
    MWDrawLine *drawLine0352 = [[MWDrawLine alloc] init];
    drawLine0352.startPoint = CGPointMake(878, 992.5);
    drawLine0352.endPoint = CGPointMake(878, 1045);
    drawLine0352.width = 10;
    drawLine0352.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0352];

    MWDrawFillCircle *fillCircle0400 = [[MWDrawFillCircle alloc] init];
    fillCircle0400.center = CGPointMake(878, 1018.5);
    fillCircle0400.radius = 13;
    fillCircle0400.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0400];
    
    MWDrawFillCircle *fillCircle0401 = [[MWDrawFillCircle alloc] init];
    fillCircle0401.center = CGPointMake(878, 1018.5);
    fillCircle0401.radius = 10;
    fillCircle0401.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0401];

    MWDrawFillCircle *fillCircle0402 = [[MWDrawFillCircle alloc] init];
    fillCircle0402.center = CGPointMake(878, 992.5);
    fillCircle0402.radius = 8.5;
    fillCircle0402.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0402];
    
    MWDrawFillCircle *fillCircle0403 = [[MWDrawFillCircle alloc] init];
    fillCircle0403.center = CGPointMake(878, 992.5);
    fillCircle0403.radius = 6.5;
    fillCircle0403.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0403];

    MWDrawFillCircle *fillCircle0404 = [[MWDrawFillCircle alloc] init];
    fillCircle0404.center = CGPointMake(878, 1045);
    fillCircle0404.radius = 8.5;
    fillCircle0404.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0404];

    MWDrawFillCircle *fillCircle0405 = [[MWDrawFillCircle alloc] init];
    fillCircle0405.center = CGPointMake(878, 1045);
    fillCircle0405.radius = 6.5;
    fillCircle0405.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0405];

    MWDrawLine *drawLine0353 = [[MWDrawLine alloc] init];
    drawLine0353.startPoint = CGPointMake(878, 992.5);
    drawLine0353.endPoint = CGPointMake(878, 1045);
    drawLine0353.width = 6;
    drawLine0353.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0353];

    //

    MWDrawLine *drawLine0354 = [[MWDrawLine alloc] init];
    drawLine0354.startPoint = CGPointMake(1362, 1416.5);
    drawLine0354.endPoint = CGPointMake(1335, 1389.5);
    drawLine0354.width = 10;
    drawLine0354.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0354];

    MWDrawFillCircle *fillCircle0406 = [[MWDrawFillCircle alloc] init];
    fillCircle0406.center = CGPointMake(1362, 1416.5);
    fillCircle0406.radius = 13;
    fillCircle0406.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0406];
    
    MWDrawFillCircle *fillCircle0407 = [[MWDrawFillCircle alloc] init];
    fillCircle0407.center = CGPointMake(1362, 1416.5);
    fillCircle0407.radius = 10;
    fillCircle0407.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0407];

    MWDrawFillCircle *fillCircle0408 = [[MWDrawFillCircle alloc] init];
    fillCircle0408.center = CGPointMake(1335, 1389.5);
    fillCircle0408.radius = 8.5;
    fillCircle0408.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0408];
   
    MWDrawFillCircle *fillCircle0409 = [[MWDrawFillCircle alloc] init];
    fillCircle0409.center = CGPointMake(1335, 1389.5);
    fillCircle0409.radius = 6.5;
    fillCircle0409.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0409];

    MWDrawLine *drawLine0355 = [[MWDrawLine alloc] init];
    drawLine0355.startPoint = CGPointMake(1362, 1416.5);
    drawLine0355.endPoint = CGPointMake(1335, 1389.5);
    drawLine0355.width = 6;
    drawLine0355.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0355];

    //
    
    MWDrawLine *drawLine0356 = [[MWDrawLine alloc] init];
    drawLine0356.startPoint = CGPointMake(1501, 1390);
    drawLine0356.endPoint = CGPointMake(1501, 1442.5);
    drawLine0356.width = 10;
    drawLine0356.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0356];

    MWDrawFillCircle *fillCircle0410 = [[MWDrawFillCircle alloc] init];
    fillCircle0410.center = CGPointMake(1501, 1390);
    fillCircle0410.radius = 8.5;
    fillCircle0410.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0410];
    
    MWDrawFillCircle *fillCircle0411 = [[MWDrawFillCircle alloc] init];
    fillCircle0411.center = CGPointMake(1501, 1390);
    fillCircle0411.radius = 6.5;
    fillCircle0411.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0411];

    MWDrawFillCircle *fillCircle0412 = [[MWDrawFillCircle alloc] init];
    fillCircle0412.center = CGPointMake(1501, 1416);
    fillCircle0412.radius = 13;
    fillCircle0412.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0412];
    
    MWDrawFillCircle *fillCircle0413 = [[MWDrawFillCircle alloc] init];
    fillCircle0413.center = CGPointMake(1501, 1416);
    fillCircle0413.radius = 10;
    fillCircle0413.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0413];

    MWDrawFillCircle *fillCircle0414 = [[MWDrawFillCircle alloc] init];
    fillCircle0414.center = CGPointMake(1501, 1442.5);
    fillCircle0414.radius = 8.5;
    fillCircle0414.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0414];
    
    MWDrawFillCircle *fillCircle0415 = [[MWDrawFillCircle alloc] init];
    fillCircle0415.center = CGPointMake(1501, 1442.5);
    fillCircle0415.radius = 6.5;
    fillCircle0415.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0415];

    MWDrawLine *drawLine0357 = [[MWDrawLine alloc] init];
    drawLine0357.startPoint = CGPointMake(1501, 1390);
    drawLine0357.endPoint = CGPointMake(1501, 1442.5);
    drawLine0357.width = 6;
    drawLine0357.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0357];

    //
    
    MWDrawLine *drawLine0358 = [[MWDrawLine alloc] init];
    drawLine0358.startPoint = CGPointMake(1639, 1416);
    drawLine0358.endPoint = CGPointMake(1639, 1442.5);
    drawLine0358.width = 10;
    drawLine0358.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0358];

    MWDrawFillCircle *fillCircle0416 = [[MWDrawFillCircle alloc] init];
    fillCircle0416.center = CGPointMake(1639, 1416);
    fillCircle0416.radius = 13;
    fillCircle0416.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0416];
    
    MWDrawFillCircle *fillCircle0417 = [[MWDrawFillCircle alloc] init];
    fillCircle0417.center = CGPointMake(1639, 1416);
    fillCircle0417.radius = 10;
    fillCircle0417.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0417];

    MWDrawFillCircle *fillCircle0418 = [[MWDrawFillCircle alloc] init];
    fillCircle0418.center = CGPointMake(1639, 1442.5);
    fillCircle0418.radius = 8.5;
    fillCircle0418.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0418];
    
    MWDrawFillCircle *fillCircle0419 = [[MWDrawFillCircle alloc] init];
    fillCircle0419.center = CGPointMake(1639, 1442.5);
    fillCircle0419.radius = 6.5;
    fillCircle0419.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0419];

    MWDrawLine *drawLine0359 = [[MWDrawLine alloc] init];
    drawLine0359.startPoint = CGPointMake(1639, 1416);
    drawLine0359.endPoint = CGPointMake(1639, 1442.5);
    drawLine0359.width = 6;
    drawLine0359.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0359];

    //

    MWDrawLine *drawLine0360 = [[MWDrawLine alloc] init];
    drawLine0360.startPoint = CGPointMake(878, 1299.5);
    drawLine0360.endPoint = CGPointMake(878, 1334.5);
    drawLine0360.width = 10;
    drawLine0360.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0360];

    MWDrawLine *drawLine0361 = [[MWDrawLine alloc] init];
    drawLine0361.startPoint = CGPointMake(897, 1351.5);
    drawLine0361.endPoint = CGPointMake(878, 1334.5);
    drawLine0361.width = 10;
    drawLine0361.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0361];

    MWDrawFillCircle *fillCircle0420 = [[MWDrawFillCircle alloc] init];
    fillCircle0420.center = CGPointMake(878, 1299.5);
    fillCircle0420.radius = 8.5;
    fillCircle0420.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0420];
    
    MWDrawFillCircle *fillCircle0421 = [[MWDrawFillCircle alloc] init];
    fillCircle0421.center = CGPointMake(878, 1299.5);
    fillCircle0421.radius = 6.5;
    fillCircle0421.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0421];

    MWDrawFillCircle *fillCircle0422 = [[MWDrawFillCircle alloc] init];
    fillCircle0422.center = CGPointMake(878, 1334.5);
    fillCircle0422.radius = 13;
    fillCircle0422.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0422];
    
    MWDrawFillCircle *fillCircle0423 = [[MWDrawFillCircle alloc] init];
    fillCircle0423.center = CGPointMake(878, 1334.5);
    fillCircle0423.radius = 10;
    fillCircle0423.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0423];

    MWDrawFillCircle *fillCircle0424 = [[MWDrawFillCircle alloc] init];
    fillCircle0424.center = CGPointMake(897, 1351.5);
    fillCircle0424.radius = 8.5;
    fillCircle0424.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0424];
    
    MWDrawFillCircle *fillCircle0425 = [[MWDrawFillCircle alloc] init];
    fillCircle0425.center = CGPointMake(897, 1351.5);
    fillCircle0425.radius = 6.5;
    fillCircle0425.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0425];

    MWDrawLine *drawLine0362 = [[MWDrawLine alloc] init];
    drawLine0362.startPoint = CGPointMake(878, 1299.5);
    drawLine0362.endPoint = CGPointMake(878, 1334.5);
    drawLine0362.width = 6;
    drawLine0362.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0362];
    
    MWDrawLine *drawLine0363 = [[MWDrawLine alloc] init];
    drawLine0363.startPoint = CGPointMake(897, 1351.5);
    drawLine0363.endPoint = CGPointMake(878, 1334.5);
    drawLine0363.width = 6;
    drawLine0363.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0363];

    //
    
    MWDrawLine *drawLine0364 = [[MWDrawLine alloc] init];
    drawLine0364.startPoint = CGPointMake(1114, 1566.5);
    drawLine0364.endPoint = CGPointMake(1150.5, 1602.5);
    drawLine0364.width = 10;
    drawLine0364.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0364];

    MWDrawFillCircle *fillCircle0426 = [[MWDrawFillCircle alloc] init];
    fillCircle0426.center = CGPointMake(1114, 1566.5);
    fillCircle0426.radius = 8.5;
    fillCircle0426.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0426];
    
    MWDrawFillCircle *fillCircle0427 = [[MWDrawFillCircle alloc] init];
    fillCircle0427.center = CGPointMake(1114, 1566.5);
    fillCircle0427.radius = 6.5;
    fillCircle0427.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0427];

    MWDrawFillCircle *fillCircle0428 = [[MWDrawFillCircle alloc] init];
    fillCircle0428.center = CGPointMake(1132.5, 1584.5);
    fillCircle0428.radius = 13;
    fillCircle0428.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0428];
    
    MWDrawFillCircle *fillCircle0429 = [[MWDrawFillCircle alloc] init];
    fillCircle0429.center = CGPointMake(1132.5, 1584.5);
    fillCircle0429.radius = 10;
    fillCircle0429.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0429];

    MWDrawFillCircle *fillCircle0430 = [[MWDrawFillCircle alloc] init];
    fillCircle0430.center = CGPointMake(1150.5, 1602.5);
    fillCircle0430.radius = 8.5;
    fillCircle0430.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0430];
    
    MWDrawFillCircle *fillCircle0431 = [[MWDrawFillCircle alloc] init];
    fillCircle0431.center = CGPointMake(1150.5, 1602.5);
    fillCircle0431.radius = 6.5;
    fillCircle0431.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0431];

    MWDrawLine *drawLine0365 = [[MWDrawLine alloc] init];
    drawLine0365.startPoint = CGPointMake(1114, 1566.5);
    drawLine0365.endPoint = CGPointMake(1150.5, 1602.5);
    drawLine0365.width = 6;
    drawLine0365.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0365];

    //
    
    MWDrawLine *drawLine0366 = [[MWDrawLine alloc] init];
    drawLine0366.startPoint = CGPointMake(1194.5, 2073.5);
    drawLine0366.endPoint = CGPointMake(1180, 2059);
    drawLine0366.width = 10;
    drawLine0366.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0366];

    MWDrawFillCircle *fillCircle0432 = [[MWDrawFillCircle alloc] init];
    fillCircle0432.center = CGPointMake(1194.5, 2073.5);
    fillCircle0432.radius = 8.5;
    fillCircle0432.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0432];
    
    MWDrawFillCircle *fillCircle0433 = [[MWDrawFillCircle alloc] init];
    fillCircle0433.center = CGPointMake(1194.5, 2073.5);
    fillCircle0433.radius = 6.5;
    fillCircle0433.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0433];

    MWDrawLine *drawLine0367 = [[MWDrawLine alloc] init];
    drawLine0367.startPoint = CGPointMake(1194.5, 2073.5);
    drawLine0367.endPoint = CGPointMake(1172, 2051);
    drawLine0367.width = 6;
    drawLine0367.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0367];

    //

    MWDrawLine *drawLine0368 = [[MWDrawLine alloc] init];
    drawLine0368.startPoint = CGPointMake(1367.5, 1819.5);
    drawLine0368.endPoint = CGPointMake(1407, 1859);
    drawLine0368.width = 10;
    drawLine0368.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0368];

    MWDrawFillCircle *fillCircle0434 = [[MWDrawFillCircle alloc] init];
    fillCircle0434.center = CGPointMake(1367.5, 1819.5);
    fillCircle0434.radius = 8.5;
    fillCircle0434.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0434];
    
    MWDrawFillCircle *fillCircle0435 = [[MWDrawFillCircle alloc] init];
    fillCircle0435.center = CGPointMake(1367.5, 1819.5);
    fillCircle0435.radius = 6.5;
    fillCircle0435.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0435];

    MWDrawFillCircle *fillCircle0436 = [[MWDrawFillCircle alloc] init];
    fillCircle0436.center = CGPointMake(1385.5, 1837.5);
    fillCircle0436.radius = 13;
    fillCircle0436.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0436];
    
    MWDrawFillCircle *fillCircle0437 = [[MWDrawFillCircle alloc] init];
    fillCircle0437.center = CGPointMake(1385.5, 1837.5);
    fillCircle0437.radius = 10;
    fillCircle0437.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0437];

    MWDrawFillCircle *fillCircle0438 = [[MWDrawFillCircle alloc] init];
    fillCircle0438.center = CGPointMake(1407, 1859);
    fillCircle0438.radius = 8.5;
    fillCircle0438.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0438];
    
    MWDrawFillCircle *fillCircle0439 = [[MWDrawFillCircle alloc] init];
    fillCircle0439.center = CGPointMake(1407, 1859);
    fillCircle0439.radius = 6.5;
    fillCircle0439.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0439];

    MWDrawLine *drawLine0369 = [[MWDrawLine alloc] init];
    drawLine0369.startPoint = CGPointMake(1367.5, 1819.5);
    drawLine0369.endPoint = CGPointMake(1407, 1859);
    drawLine0369.width = 6;
    drawLine0369.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0369];

    //
    
    MWDrawLine *drawLine0370 = [[MWDrawLine alloc] init];
    drawLine0370.startPoint = CGPointMake(1525.5, 1644);
    drawLine0370.endPoint = CGPointMake(1574, 1693);
    drawLine0370.width = 10;
    drawLine0370.color = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:drawLine0370];

    MWDrawFillCircle *fillCircle0440 = [[MWDrawFillCircle alloc] init];
    fillCircle0440.center = CGPointMake(1525.5, 1644);
    fillCircle0440.radius = 8.5;
    fillCircle0440.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0440];
    
    MWDrawFillCircle *fillCircle0441 = [[MWDrawFillCircle alloc] init];
    fillCircle0441.center = CGPointMake(1525.5, 1644);
    fillCircle0441.radius = 6.5;
    fillCircle0441.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0441];

    MWDrawFillCircle *fillCircle0442 = [[MWDrawFillCircle alloc] init];
    fillCircle0442.center = CGPointMake(1546.5, 1664.5);
    fillCircle0442.radius = 13;
    fillCircle0442.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0442];
    
    MWDrawFillCircle *fillCircle0443 = [[MWDrawFillCircle alloc] init];
    fillCircle0443.center = CGPointMake(1546.5, 1664.5);
    fillCircle0443.radius = 10;
    fillCircle0443.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0443];

    MWDrawFillCircle *fillCircle0444 = [[MWDrawFillCircle alloc] init];
    fillCircle0444.center = CGPointMake(1574, 1693);
    fillCircle0444.radius = 8.5;
    fillCircle0444.fillColor = [UIColor blackColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0444];
    
    MWDrawFillCircle *fillCircle0445 = [[MWDrawFillCircle alloc] init];
    fillCircle0445.center = CGPointMake(1574, 1693);
    fillCircle0445.radius = 6.5;
    fillCircle0445.fillColor = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:fillCircle0445];

    MWDrawLine *drawLine0371 = [[MWDrawLine alloc] init];
    drawLine0371.startPoint = CGPointMake(1525.5, 1644);
    drawLine0371.endPoint = CGPointMake(1574, 1693);
    drawLine0371.width = 6;
    drawLine0371.color = [UIColor whiteColor];
    [self.additionalOverMapPrimitives addObject:drawLine0371];

    return self;
}

@end
